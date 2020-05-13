import 'dart:async';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sag/utils/constants.dart';
class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  String data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print("_localPath " + directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/sagdata.json');
  }

  Future<File> _downloadCacheFile(String url, String filename) async {
        var file = await DefaultCacheManager().getSingleFile(url);
        // var bytes = file.
        // String dir = (await getApplicationDocumentsDirectory()).path;
        // File file = new File('$dir/$filename');
        // print("_downloadFile " + file.path);
        // await file.writeAsBytes(bytes);
        return file;
  }

  // Future<File> _downloadFile(String url, String filename) async {
  //     http.Client client = new http.Client();
  //     var req = await client.get(Uri.parse(url));
  //     var bytes = req.bodyBytes;
  //     String dir = (await getApplicationDocumentsDirectory()).path;
  //     File file = new File('$dir/$filename');
  //     print("_downloadFile " + file.path);
  //     await file.writeAsBytes(bytes);
  //     return file;
  // }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  @override
  void initState() {
    super.initState();
    _downloadCacheFile(Constants.SAG_DATA_URL,"sagdata.json");
    readContent().then((String value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing data')),
      body: Center(
        child: Text(
          'Data read from a file: \n $data',
        ),
      ),
    );
  }
}