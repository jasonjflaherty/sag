import 'package:flutter/material.dart';
import 'package:sag/pages/qaPage.dart';
import 'file:///C:/Users/jflaherty/Documents/Development/mobile/sagweb/lib/widgets/widgetsNavbars.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import '../main.dart';

class LegalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar("Legal", context),
      body: Center(
        child: Text("Legal Information"),
      ),
      bottomNavigationBar: navBottomBar(1, context),
    );
  }
}
