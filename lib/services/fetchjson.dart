import 'dart:io';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sag/models/sagitemstatic.dart';
import 'package:sag/utils/constants.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_downloader/image_downloader.dart';


class FetchJson {
  static String url = Constants.SAG_DATA_URL;
  static List<SagItem> list = parseSagItems('[{"Manufacture": "sorry, there has been an error loading data","Model": "No network file available...","Comments": "","Image": "","Description": ""}]');
  List<File> _mulitpleFiles = [];
/**

If online, just get the file with DefaultCacheManager.
Download all images to temp()

If offline, check the DefaultCacheManager and compare file to local file.

**/

  static Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/sagdata.json');
  }

  static Future<List<SagItem>> getSagData() async {
    var filePath;   
    //find out if there is a connection, if there is, get the file into the cache
    try {
      final result = await InternetAddress.lookup("fs.usda.gov");
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
        print("200... post file from network if needed, and write to the local file for offline.");
        String contents = await filePath.readAsString();
        list = parseSagItems(contents);
        return list;
      } else {
        print("ERROR... Status code not 200, so getting local file...");
        list = parseSagItems(await readLocalSagData());
        return list;
      }
    } catch (e) {
      //better for users to see the error than just the app quiting....
      print("Try Error... " + e.toString());
      print("however, we are reading cached file to thwart this.");
      String contents = await filePath.readAsString();
      list = parseSagItems(contents);
      return list;
    }
  }

  // //get all the images downloaded for offliness...
  // static List<SagItem> parseSagImages(String responseBody){
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    

    
  //   return parsed.map<SagItem>((json) => SagItem.fromJson(json)).toList();

  // }

  //list is ready for sagList.dart
  static List<SagItem> parseSagItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SagItem>((json) => SagItem.fromJson(json)).toList();
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/sagdata.json');
  }

  static Future<File> compareSagFiles(File one, File two) async {
    if(one.lengthSync()  >= two.lengthSync()){
      print("compareSagFile One");
      return one;
    }else{
      print("compareSagFile Two");
      return two;
    }
  }

  static Future<File> writeSagData(String data) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(data);
  }

  static Future<String> readLocalSagData() async {
    try {
      final file = await _localFile;
      // Read the file.
      String contents = await file.readAsString();
      return contents;

    } catch (e) {
      // If encountering an error, return 0.
      return '[{"Manufacture": "Ut oh! There has been an Error...","Model": "Caught error is: ' + e.toString() + '","Comments": "","Image": "","Description": ""}]';
    }
  }
}