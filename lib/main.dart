import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/pages/sagLandingPageWithNavigation.dart';
import 'package:getflutter/getflutter.dart';

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
            Scaffold(
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
                        onPressed: () {},
                        size: GFSize.LARGE,
                        blockButton: true,
                        text: "Chainsaws",
                        fullWidthButton: true,
                        color: Colors.brown,
                      ),
                      SizedBox(height: 10),
                      GFButton(
                        onPressed: () {},
                        blockButton: true,
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        text: "General Purpose",
                        color: Colors.brown,
                      ),
                      SizedBox(height: 10),
                      GFButton(
                        onPressed: () {},
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
        ));
  }
}

class ChainsawList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.SAG_APP_TITLE,
        //home: MyApp() //this is for testing
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Center(
          child: Text("CHAINSAWS"),
        ));
  }
}

class GeneralList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.SAG_APP_TITLE,
      //home: MyApp() //this is for testing
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Center(
        child: Text("GENERAL"),
      ),
    );
  }
}

class OtherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.SAG_APP_TITLE,
        //home: MyApp() //this is for testing
        theme: new ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Center(
          child: Text("OTHER"),
        ));
  }
}
