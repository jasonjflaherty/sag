import 'package:flutter/material.dart';
import 'package:sag/pages/legalPage.dart';
import 'package:sag/pages/qaPage.dart';
import 'package:sag/pages/sagList.dart';

class SagSearchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
      return _SagSearchPageState();
    }
}
  class _SagSearchPageState extends State<SagSearchPage>{
    int _index = 0;
    final List<Widget> _pages = [
      SagFilterData(),
      LegalWidget(),
      QAWidget(),
    ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar set in each page widget
      body: _pages[_index],
//       bottomNavigationBar: FancyBottomNavigation(
// //        onTap: onTabTapped, // new
// //        currentIndex: _index, // new
//         tabs: [
//           TabData(iconData: Icons.search,title: "Search"),
//           TabData(iconData: Icons.language,title: "Legal"),
//           TabData(iconData: Icons.question_answer,title: "Q&A"),

// //          BottomNavigationBarItem(
// //            icon: new Icon(Icons.search,semanticLabel: "Search",),
// //            title: new Text('Search')
// //          ),
// //          BottomNavigationBarItem(
// //            icon: new Icon(Icons.language,semanticLabel: "Legal Information",),
// //            title: new Text('Legal')
// //          ),
// //          BottomNavigationBarItem(
// //            icon: new Icon(Icons.question_answer,semanticLabel: "Questions and Answers",),
// //            title: new Text('Q&A')
// //          ),
//         ],
//         onTabChangedListener: (position){
//           setState(() {
//             _index = position;
//           });
//         },
//       ),
    );
  }
//  void onTabTapped(int index) {
//    setState(() {
//      _index = index;
//      //debugPrint("Current Navigation: " + index.toString());
//    });
//  }
}
