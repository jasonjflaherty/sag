import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sag/models/chainsaws.dart';
import 'package:sag/pages/chainsawList.dart';
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
                        MaterialPageRoute(builder: (context) => GeneralList()),
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
                        MaterialPageRoute(builder: (context) => OtherList()),
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
    );
  }
}

class ChainsawList extends StatelessWidget {
  final List<Chainsaws> chainsaws;

  const ChainsawList({Key key, this.chainsaws}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chainsaws>>(
      future: _fetchChainsaws(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Chainsaws> data = snapshot.data;
          return _chainsawListView(data);
        } else if (snapshot.hasError) {
          return Container(
              alignment: Alignment(0.0, 0.0), child: Text("${snapshot.error}"));
        }
        return Container(
            alignment: Alignment(0.0, 0.0), child: CircularProgressIndicator());
      },
    );
  }
}

Future<List<Chainsaws>> _fetchChainsaws() async {
  final chainsawListAPIUrl = 'https://www.nwcg.gov/json/chainsaws.json';
  final response = await http.get(chainsawListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((chainsaw) => new Chainsaws.fromJson(chainsaw))
        .toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

class ChainsawsWidget extends StatefulWidget {
  @override
  _ChainsawsWidgetState createState() => _ChainsawsWidgetState();
}

class _ChainsawsWidgetState extends State<ChainsawsWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chainsaw Spark Arresters"),
      ),
      body: FutureBuilder<List<Chainsaws>>(
        future: _fetchChainsaws(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Chainsaws> data = snapshot.data;
            return _chainsawListView(data);
          } else if (snapshot.hasError) {
            return Container(
                alignment: Alignment(0.0, 0.0),
                child: Text("${snapshot.error}"));
          }
          return Container(
              alignment: Alignment(0.0, 0.0),
              child: CircularProgressIndicator());
        },
      ),
//      body: GFSearchBar(
//    searchList: ,
//    searchQueryBuilder: (query, list) {
//    return list
//        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//        .toList();
//    },
//    overlaySearchListItemBuilder: (item) {
//    return Container(
//    padding: const EdgeInsets.all(8),
//    child: Text(
//    item,
//    style: const TextStyle(fontSize: 18),
//    ),
//    );
//    },
//    onItemSelected: (item) {
//    setState(() {
//    print('$item');
//    });
//    },
//      ),
    );
  }
}

//"model": "Dayton 2Z971",
//"exhaust": 245,
//"mfr": "P/W",
//"handlebar": "1/2",
//"spike": "NR",
//"cbHg": "O",
//"remarks": "~"
ListView _chainsawListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(
            data[index].model,
            data[index].exhaust,
            data[index].mfr,
            data[index].handlebar,
            data[index].spike,
            data[index].cbHg,
            data[index].remarks);
      });
}

ListTile _tile(String model, String exhaust, String mfr, String handlebar,
        String spike, String cbHg, String remarks) =>
    ListTile(
      title: Text("Model: " + model,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      subtitle: Text(
        "Exhaust: " +
            exhaust +
            "\n" +
            "MFR: " +
            mfr +
            "\n" +
            "Handlebar (in): " +
            handlebar +
            "\n" +
            "Spike: " +
            spike +
            "\n" +
            "CB/HG: " +
            cbHg +
            "\n" +
            "Remarks: " +
            remarks,
        style: TextStyle(fontSize: 14),
      ),
    );

class GeneralList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Spark Arresters"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class OtherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Spark Arresters"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
