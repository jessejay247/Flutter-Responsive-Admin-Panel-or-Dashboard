import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/transaction_page_content.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // final GlobalKey<ScaffoldState> _transactionKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Transaction",

      // key: _transactionKey,
      page: TransactionPageContent(),
    );
  }
}
