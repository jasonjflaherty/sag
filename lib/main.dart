import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:sag/pages/chainsawList.dart';
import 'package:sag/pages/generalList.dart';
import 'package:sag/pages/otherList.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/widgets/connectivitywarning.dart';
import 'dart:io';
import 'widgets/widgetsNavbars.dart';

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
            _HomeApp());
  }
}

class _HomeApp extends StatefulWidget {
  _HomeApp({Key key}) : super(key: key);

  __HomeAppState createState() => __HomeAppState();
}

class __HomeAppState extends State<_HomeApp> {
  bool _visible = false;
  var _catcherror = "";
  @override
  void initState() {
    super.initState();
    _vis().then((value) {
      setState(() {
        _visible = value;
      });
    });
  }

  Future<bool> _vis() async {
    try {
      final result = await InternetAddress.lookup('www.fs.usda.gov');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      _catcherror = e.toString();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar(Constants.SAG_APP_TITLE, context),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          connectivityCheck(_visible,_catcherror,context),
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
      bottomNavigationBar: navBottomBar(0, context),
    );
  }
}
