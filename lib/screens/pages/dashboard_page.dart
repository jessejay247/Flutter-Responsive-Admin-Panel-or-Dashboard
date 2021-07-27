import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'pageContent/dashboard_page_content.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

// final GlobalKey<ScaffoldState> _dashKey = GlobalKey<ScaffoldState>();

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      // key: _dashKey,
      pageTitle: "Dashboard",
      page: DashboardPageContent(),
    );
  }
}
