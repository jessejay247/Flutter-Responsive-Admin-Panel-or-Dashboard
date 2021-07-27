import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/withdraw_page_content.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  // final GlobalKey<ScaffoldState> _transactionKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Withdraw",

      // key: _transactionKey,
      page: WithdrawPageContent(),
    );
  }
}
