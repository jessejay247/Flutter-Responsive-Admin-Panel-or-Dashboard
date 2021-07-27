import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/referral_page_contenty.dart';
import 'package:flutter/material.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({Key key}) : super(key: key);

  @override
  _ReferralPageState createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  // final GlobalKey<ScaffoldState> _referralKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Referral",

      // key: _referralKey,
      page: ReferralPageContent(),
    );
  }
}
