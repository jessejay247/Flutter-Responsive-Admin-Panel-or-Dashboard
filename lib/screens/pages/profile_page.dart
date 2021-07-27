import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'pageContent/profile_page_content.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final GlobalKey<ScaffoldState> _profileKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Profile",

      // key: _profileKey,
      page: ProfilePageContent(),
    );
  }
}
