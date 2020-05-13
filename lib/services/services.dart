import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sag/models/sagitemstatic.dart';
import 'package:sag/utils/constants.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Services {
  static String url = Constants.SAG_DATA_URL;
  static List<SagItem> list = parseSagItems('[{"Manufacture": "sorry, there has been an error loading data","Model": "No network file available...","Comments": "","Image": "","Description": ""}]');
  
  static Future<List<SagItem>> getSagData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        list = parseSagItems(response.body);
        return list;
      } else {
        //better for users to see the error than just the app quiting....
        return list = parseSagItems('[{"Manufacture": "Ut oh! There has been an Error...","Model": "Response error is: ' + response.headers.toString() + '","Comments": "","Image": "","Description": ""}]');
        //throw Exception("Error");
      }
    } catch (e) {
      //better for users to see the error than just the app quiting....
      return list = parseSagItems('[{"Manufacture": "Ut oh! There has been an Error...","Model": "Caught error is: ' + e.toString() + '","Comments": "","Image": "","Description": ""}]');
      //throw Exception(e.toString());
    }
  }
  static List<SagItem> parseSagItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SagItem>((json) => SagItem.fromJson(json)).toList();
  }
}