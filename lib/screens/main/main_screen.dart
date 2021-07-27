import 'package:admin/controllers/MenuController.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_template.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    @required this.page,
    @required this.pageTitle,
    this.key,
  });
  final Widget page;
  final Key key;
  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().dashKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardTemplate(
                pageTitle: pageTitle,
                widget: page,
                // DashboardPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
