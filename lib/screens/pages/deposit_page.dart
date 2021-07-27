import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/deposit_page_content.dart';
import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({
    Key key,
    this.address,
    this.amount,
    this.currency,
    this.cryptoprice,
    this.orderRef,
    this.unit,
  }) : super(key: key);

  final String address;
  final amount;
  final currency;
  final cryptoprice;
  final orderRef;
  final unit;
  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  // final GlobalKey<ScaffoldState> _transactionKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Deposit",

      // key: _transactionKey,
      page: DepositPageContent(
        address: widget.address,
        amount: widget.amount,
        currency: widget.currency,
        cryptoprice: widget.cryptoprice,
        orderRef: widget.orderRef,
        unit: widget.unit,
      ),
    );
  }
}
