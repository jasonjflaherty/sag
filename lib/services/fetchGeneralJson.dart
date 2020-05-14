import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sag/models/generals.dart';
import 'package:sag/utils/constants.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

//{
//"model": "Craftsman 358.36218X",
//"exhaust": "2100A ",
//"mfr": "ZEN ",
//"handlebar": "1/2",
//"spike": "MIS",
//"cbHg": "Yes",
//"remarks": "2100A stamped into the front half of muffler"
//},

class FetchJson {
  static String url = Constants.SAG_GENERAL_DATA_URL;
  static List<GSAs> list = parseGSAItems(
      '[{"model": "sorry, there has been an error loading data","exhaust": "No network file available...","mfr": "","handlebar": "","spike": "","cbHg":"","remarks":""}]');

/**

If online, just get the file with DefaultCacheManager.
Download all images to temp()

If offline, check the DefaultCacheManager and compare file to local file.

**/
  static Future<List<GSAs>> getGSAData() async {
    var filePath;
    //find out if there is a connection, if there is, get the file into the cache
    try {
      final result = await InternetAddress.lookup(Constants.SAG_ROOT_URL);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected to internet');
        filePath = await DefaultCacheManager().getSingleFile(url);
      }
    } on SocketException catch (_) {
      print('not connected to internet');
      //send cached filepath
      try {
        filePath = await DefaultCacheManager().getSingleFile(url);
      } catch (e) {
        print("Not Connected Error: " + e.toString());
        filePath = _localFile;
      }
    }

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(
            "200... post file from network if needed, and write to the local file for offline.");
        String contents = await filePath.readAsString();
        list = parseGSAItems(contents);
        return list;
      } else {
        print("ERROR... Status code not 200, so getting local file...");
        list = parseGSAItems(await readLocalGSAData());
        return list;
      }
    } catch (e) {
      //better for users to see the error than just the app quiting....
      print("Try Error... " + e.toString());
      print("however, we are reading cached file to thwart this.");
      String contents = await filePath.readAsString();
      list = parseGSAItems(contents);
      return list;
    }
  }

  static List<GSAs> parseGSAItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<GSAs>((json) => GSAs.fromJson(json)).toList();
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/general-purpose-spark-arrester.json');
  }

  static Future<File> compareGSAFiles(File one, File two) async {
    if (one.lengthSync() >= two.lengthSync()) {
      print("compareGSAFile One");
      return one;
    } else {
      print("compareGSAFile Two");
      return two;
    }
  }

  static Future<File> writeGSAData(String data) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(data);
  }

  static Future<String> readLocalGSAData() async {
    try {
      final file = await _localFile;
      // Read the file.
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return '[{"Manufacture": "Ut oh! There has been an Error...","Model": "Caught error is: ' +
          e.toString() +
          '","Comments": "","Image": "","Description": ""}]';
    }
  }
}
