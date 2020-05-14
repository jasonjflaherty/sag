import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sag/models/chainsaws.dart';
import 'package:sag/pages/chainsawList.dart';
import 'package:sag/pages/generalList.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/otherList.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:sag/services/webservice.dart';
import 'package:sag/utils/constants.dart';
import 'package:getflutter/getflutter.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.SAG_APP_TITLE,
        //home: MyApp() //this is for testing
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: //SagSearchPage(),
            Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.SAG_APP_TITLE),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: GFImageOverlay(
                boxFit: BoxFit.cover,
                image: AssetImage('assets/sparksandlogo.png')),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: <Widget>[
                  GFTypography(
                    text: 'Choose a Spark Arrester Category',
                    type: GFTypographyType.typo3,
                    showDivider: false,
                  ),
                  SizedBox(height: 10),
                  GFButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChainsawFilterData()),
                      );
                    },
                    size: GFSize.LARGE,
                    blockButton: true,
                    text: "Chainsaws",
                    fullWidthButton: true,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 10),
                  GFButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GSAFilterData()),
                      );
                    },
                    blockButton: true,
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                    text: "General Purpose",
                    color: Colors.brown,
                  ),
                  SizedBox(height: 10),
                  GFButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtherFilterData()),
                      );
                    },
                    blockButton: true,
                    size: GFSize.LARGE,
                    fullWidthButton: true,
                    color: Colors.brown,
                    text: "Other",
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: TitledBottomNavigationBar(
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
