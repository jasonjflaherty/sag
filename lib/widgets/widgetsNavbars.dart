import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sag/pages/chainsawList.dart';
import 'package:sag/pages/generalList.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/otherList.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:toast/toast.dart';

import '../main.dart';
import '../utils/constants.dart';

Widget navAppBar(String pagetitle, BuildContext context) {
  return AppBar(
    title: Text(pagetitle),
    actions: <Widget>[
      PopupMenuButton<String>(
        onSelected: (val) => navAction(val, context),
        itemBuilder: (BuildContext context) {
          return Constants.navchoices.map((String navchoice) {
            return PopupMenuItem<String>(
              value: navchoice,
              child: Text(navchoice),
            );
          }).toList();
        },
      ),
    ],
  );
}

Widget navBottomBar(int _currentIndex, BuildContext context) {
  return TitledBottomNavigationBar(
      currentIndex:
          _currentIndex, // Use this to update the Bar giving a position
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
      },
      items: [
        TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
        TitledNavigationBarItem(title: Text('Legal'), icon: Icons.description),
        TitledNavigationBarItem(
            title: Text('Q&A'), icon: Icons.question_answer),
      ]);
}

void navAction(String nav, BuildContext context) {
  if (nav == Constants.NAV_CHAINSAW) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChainsawFilterData()),
    );
  } else if (nav == Constants.NAV_GENERAL) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GSAFilterData()),
    );
  } else if (nav == Constants.NAV_OTHER) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherFilterData()),
    );
  } else if (nav == "Refresh Data") {
    Toast.show("Data Refreshed!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.green);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => App()),
    );
  }
}
