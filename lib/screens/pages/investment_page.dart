import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/investment_page_content.dart';
import 'package:flutter/material.dart';

class InvestmentPage extends StatefulWidget {
  const InvestmentPage({Key key}) : super(key: key);

  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  // final GlobalKey<ScaffoldState> _investmentKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Investment",

      // key: _investmentKey,
      page: InvestmentPageContent(),
    );
  }
}
