import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/settings_page_content.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // final GlobalKey<ScaffoldState> _settingsKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Settings",

      // key: _settingsKey,
      page: SettingsPageContent(),
    );
  }
}
