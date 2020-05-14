import 'package:flutter/material.dart';
import 'package:sag/widgets/WidgetUrlCard.dart';
import 'package:sag/widgets/reusableCard.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/pages/chainsawList.dart';
import 'package:sag/pages/generalList.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/otherList.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import '../main.dart';
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
      ),bottomNavigationBar: TitledBottomNavigationBar(
          currentIndex: 0, // Use this to update the Bar giving a position
          onTap: (index) {
            switch (index) {
              case 0:
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App()),
                  );
                }
                break;

              case 1:
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LegalWidget()),
                  );
                }
                break;
              case 2:
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QAWidget()),
                  );
                }
                break;
              default:
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => App()),
                  );
                }
                break;
            }
            print("Selected Index: $index");
          },
          items: [
            TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
            TitledNavigationBarItem(
                title: Text('Legal'), icon: Icons.description),
            TitledNavigationBarItem(
                title: Text('Q&A'), icon: Icons.question_answer),
          ]),
   );
 }
}