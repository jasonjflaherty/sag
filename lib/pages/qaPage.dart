import 'package:flutter/material.dart';
import 'package:sag/widgets/WidgetUrlCard.dart';
import 'package:sag/widgets/reusableCard.dart';
import 'package:sag/utils/constants.dart';
class QAWidget extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(Constants.SAG_APP_TITLE + " Q&A"),
       centerTitle: true,
     ),
      body: Column(
        children: <Widget>[
          reusableTextCard("Links to Information","When clicked these will open your system browser."),
          WidgetClickToUrlCard("Do I Need a Spark Arrester?","https://www.fs.fed.us/t-d/programs/fire/spark/faq.html#SA"),
          WidgetClickToUrlCard("Where are Spark Arresters Required?","https://www.fs.fed.us/t-d/programs/fire/spark/faq.html#UPDATES-GP"),
          WidgetClickToUrlCard("What to expect during an inspection","https://www.fs.fed.us/t-d/programs/fire/spark/faq.html#REPRINT-GP"),
          WidgetClickToUrlCard("How to determine if I have a USFS approved SA","https://www.fs.fed.us/t-d/programs/fire/spark/faq.html#DISCONTINUED"),
        ],
      ),
   );
 }
}