import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sag/models/sagitemstatic.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/services/fetchjson.dart';
import 'package:sag/pages/sagDetails.dart';

class SagFilterData extends StatefulWidget {
  SagFilterData() : super();

  final String title = Constants.SAG_APP_TITLE;

  @override
  SagFilterDataState createState() => SagFilterDataState();
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

class SagFilterDataState extends State<SagFilterData> {
  List<Chainsaw> item;
  List<Chainsaw> filteredItem;
  final _debouncer = Debouncer(milliseconds: 500);
  //set loading to false inital so no show spinner
  bool _isLoading = false;

  @override
  void initState() {
    //set the spinner to true
    setState(() => _isLoading = true);
    super.initState();
    FetchJson.getSagData().then((sagDataFromJson) {
      setState(() {
        item = sagDataFromJson;
        filteredItem = item;
        //make it false once the items are aready
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.SAG_APP_TITLE),
        centerTitle: true,
      ),
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
                    hintText: 'Filter by Manufacturer or Model',
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
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(sagitem: filteredItem[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  filteredItem[index].manufacturer,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  filteredItem[index].model.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black54,
                                  ),
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
    );
  }
}
