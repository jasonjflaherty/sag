import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetClickToUrlCard extends StatelessWidget {
  String titleTxt = "Default Title";
  String linkUrl;
  WidgetClickToUrlCard(this.titleTxt,this.linkUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            child: 
              ListTile(
                leading: Icon(Icons.blur_on, size: 50),
                title: Text(titleTxt),
                //subtitle: Text(subTitleTxt),
              ),
            onTap: () => _launchURL(),
          ),
        ],
      ),
    );
  }
  //opens webpage link in browser
  _launchURL() async {
    if (await canLaunch(linkUrl)) {
      await launch(linkUrl);
    } else {
      throw 'Could not launch $linkUrl';
    }
  }
}
