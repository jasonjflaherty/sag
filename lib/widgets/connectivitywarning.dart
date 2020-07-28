import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget connectivityCheck(bool _visible, var _error, BuildContext context) {
  return Visibility(
    visible: _visible,
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      padding: EdgeInsets.all(10),
      child: Text(
        _error,
        //"WARNING! Cannot connect to fs.usda.gov\n Confirm you have a data connection for current data.\n Cached data on device is still available.",
        style: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        maxLines: 4,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
