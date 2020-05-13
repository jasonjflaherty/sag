import 'package:flutter/material.dart';

class reusableTextCard extends StatelessWidget {
  String titleTxt = "Default Title Text";
  String subTitleTxt = "Subtitle Text";
  reusableTextCard(this.titleTxt,this.subTitleTxt);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.yellow,
        //replaced Column() and childred in widget[]
        //mainAxisSize: MainAxisSize.min,
        child:
          InkWell(
            child:
            ListTile(
              leading: Icon(Icons.open_in_browser, size: 50,color: Colors.black87,),
              title: Text(titleTxt),
              subtitle: Text(subTitleTxt),
            ),
            //onTap: () => _launchURL(),
          ),
      ),
    );
  }
}
