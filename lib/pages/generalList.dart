import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:sag/models/generals.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:sag/services/fetchGeneralJson.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/widgets/widgetsNavbars.dart';


import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import '../main.dart';

class GSAFilterData extends StatefulWidget {
  GSAFilterData() : super();

  final String title = Constants.SAG_APP_TITLE;

  @override
  GSAFilterDataState createState() => GSAFilterDataState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class GSAFilterDataState extends State<GSAFilterData> {
  List<GSAs> item;
  List<GSAs> filteredItem;
  final _debouncer = Debouncer(milliseconds: 500);
  //set loading to false inital so no show spinner
  bool _isLoading = false;

  @override
  void initState() {
    //set the spinner to true
    setState(() => _isLoading = true);
    super.initState();
    FetchJson.getGSAData().then((otherDataFromJson) {
      setState(() {
        item = otherDataFromJson;
        filteredItem = item;
        //make it false once the items are aready
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar("Data for General Spark Arresters", context),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              semanticsLabel: "Loading Data",
            ))
          : Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Filter by Manufacturer, Model or Description',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (string) {
                    _debouncer.run(() {
                      setState(() {
                        filteredItem = item
                            .where((s) => (s.manufacturer
                                    .toLowerCase()
                                    .contains(string.toLowerCase()) ||
                                s.model
                                    .toLowerCase()
                                    .contains(string.toLowerCase()) ||
                                s.description
                                    .toLowerCase()
                                    .contains(string.toLowerCase())))
                            .toList();
                      });
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(5.0),
                    itemCount: filteredItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: InkWell(
                          splashColor: Colors.grey,
//                          onTap: () async {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) =>
//                                    DetailScreen(sagitem: filteredItem[index]),
//                              ),
//                            );
//                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GFTypography(
                                  text: "Model: " + filteredItem[index].model,
                                  type: GFTypographyType.typo3,
                                  showDivider: false,
                                  // dividerColor: Colors.black54,
                                  // dividerWidth: MediaQuery.of(context).size.width,
                                ),
                                GFTypography(
                                  text: "Manufacturer: " +
                                      filteredItem[index].manufacturer,
                                  type: GFTypographyType.typo5,
                                  showDivider: false,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                GFTypography(
                                  showDivider: false,
                                  text: "Remarks: " +
                                      filteredItem[index].description,
                                  type: GFTypographyType.typo5,
                                ),
                                // Icon(
                                //   Icons.arrow_forward_ios,
                                //   color: Colors.black54,
                                //   size:24.0,
                                //   semanticLabel: 'Click to visit details screen',
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: navBottomBar(0, context),
    );
  }
}
