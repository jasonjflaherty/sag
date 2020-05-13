import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sag/models/sagitemstatic.dart';
import 'package:sag/utils/constants.dart';
import 'package:sag/widgets/sagDetailsImage.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final SagItem sagitem;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.sagitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.SAG_APP_TITLE + " for " + sagitem.manufacturer + " " + sagitem.model),
        centerTitle: true,
      ),
      body: new Container(
        child: SingleChildScrollView(
          //padding: new EdgeInsets.all(0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                //new Text(sagitem.manufacturer, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                new Container(
                    //padding: new EdgeInsets.all(0),
                    child: new Column(
                      children: [
                        Center(
                          //sagDetailsImage.dart
                          child: SagImage(
                            //pass this back to the widget
                              sagitem.image
                            ),
                        ),
                      ],
                    ),
                  ),
                
                new Container(
                    //padding: new EdgeInsets.all(0),
                    child: new Column(
                        children: <Widget>[
                          ListTile(title: Text("DESCRIPTION"), subtitle: Text(sagitem.description, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                          Divider(color: Colors.blueGrey),
                          ListTile(title: Text("COMMENTS"), subtitle: Text(sagitem.comments, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                          Divider(color: Colors.blueGrey),
                          ListTile(title: Text("MANUFACTURER"), subtitle: Text(sagitem.manufacturer, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                          ListTile(title: Text("MODEL"), subtitle: Text(sagitem.model, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                        ],
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}