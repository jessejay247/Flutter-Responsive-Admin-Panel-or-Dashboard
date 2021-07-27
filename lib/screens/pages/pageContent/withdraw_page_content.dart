import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/components/trxnTable.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:flutter/material.dart';

class WithdrawPageContent extends StatelessWidget {
  const WithdrawPageContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CustContainer(
                children: [
                  TrxnTable(title: "Withdrawal History"),
                ],
              ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) RequestWithdrawWid(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: RequestWithdrawWid(),
          ),
      ],
    );
  }
}

class RequestWithdrawWid extends StatefulWidget {
  const RequestWithdrawWid({
    Key key,
  }) : super(key: key);

  @override
  _RequestWithdrawWidState createState() => _RequestWithdrawWidState();
}

class _RequestWithdrawWidState extends State<RequestWithdrawWid> {
  String type;

  @override
  Widget build(BuildContext context) {
    return CustContainer(
      children: [
        Center(
          child: CustHeading(
            title: "Balance",
            fontSize: 18,
          ),
        ),
        SizedBox(height: defaultPadding),
        Center(child: Text("USD 0")),
        SizedBox(height: defaultPadding),
        Center(
          child: CustButton(
            icon: Icons.attach_money,
            onPressed: popWithdrawRequest,
            title: "Withdrawal",
            horizontalMult: 2.5,
          ),
        ),
      ],
    );
  }

  popWithdrawRequest() {
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                content: Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustHeading(title: "Create Payout Request"),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text("Amount"),
                      CustTextBox(
                        prefixText: "USD",
                        hintText: "Enter Amount",
                      ),
                      Text(
                        "Withdrawal Charge is 4%",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text("Type"),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint:
                            type != null ? Text(type) : Text("Withdrawal Type"),
                        items: <String>['BTC', 'ETH', 'LTC', 'USDT']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            type = value;
                            print(type);
                          });
                        },
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text("Address"),
                      CustTextBox(
                        hintText: "Wallet Address",
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Center(
                        child: CustButton(
                          icon: Icons.attach_money,
                          onPressed: popWithdrawRequest,
                          title: "Request Payout",
                          horizontalMult: 2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
