import 'package:admin/components/header.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class DashboardTemplate extends StatelessWidget {
  const DashboardTemplate({
    Key key,
    @required this.widget,
    @required this.pageTitle,
  }) : super(key: key);
  final Widget widget;

  final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: widget,
            ),
            Header(
              pageTitle: pageTitle,
            ),
          ],
        ),
      ),
    );
  }
}
