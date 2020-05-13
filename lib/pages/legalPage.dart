import 'package:flutter/material.dart';
import 'package:sag/utils/constants.dart';
class LegalWidget extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(Constants.SAG_APP_TITLE + " Legal"),
       centerTitle: true,
     ),
      body:Center(
        child: Text("Legal Information"),
     ),
   );
 }
}