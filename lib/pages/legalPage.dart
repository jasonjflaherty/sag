import 'package:flutter/material.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/pages/chainsawList.dart';
import 'package:sag/pages/generalList.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/otherList.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import '../main.dart';

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