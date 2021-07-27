import 'package:admin/backend/apis.dart';
import 'package:admin/backend/backend_repo.dart';
import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/strings.dart';
import 'package:admin/models/MyFiles.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/pages/deposit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'file_info_card.dart';

class MyTransactions extends StatefulWidget {
  const MyTransactions({
    Key key,
  }) : super(key: key);

  @override
  _MyTransactionsState createState() => _MyTransactionsState();
}

List<String> items = [
  'BTC',
  'ETH',
  'LTC',
  'USDC',
  "DAI",
  "DOGE",
  "BCH",
];

Repos _repos = Repos();

TextEditingController _amountCtrl = TextEditingController();

class _MyTransactionsState extends State<MyTransactions> {
  String type;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(
            //   "My Files",
            //   style: Theme.of(context).textTheme.subtitle1,
            // ),
            CustButton(
              icon: IconlyBroken.plus,
              onPressed: popDepositRequest,
              title: "  Deposit",
              horizontalMult: 1.5,
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }

  popDepositRequest() {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustHeading(title: "Create Deposit"),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Text("Amount"),
                  CustTextBox(
                    controller: _amountCtrl,
                    prefixText: "USD",
                    hintText: "Enter Amount",
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Text("Type"),
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: type != null ? Text(type) : Text("Payment Type"),
                    items: items.map((String value) {
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
                  Center(
                    child: CustButton(
                      icon: Icons.attach_money,
                      onPressed: () async {
                        try {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => DepositPage(address: ,),
                          //   ),
                          // );
                          await _repos
                              .getCoinbase(
                                  "Deposit", "Deposit", _amountCtrl.text)
                              .then((value) {
                            String currency = getAddress(type);
                            var addr = value["addresses"][currency];
                            var cryptoprice =
                                value["pricing"][currency]["amount"];
                            var code = value["code"];
                            print(addr);
                            Navigator.pushNamed(
                              context,
                              "/deposit/$addr/${_amountCtrl.text}/$cryptoprice/$currency/$code/${type ?? "BTC"}",
                              // MaterialPageRoute(
                              //   builder: (_) => DepositPage(
                              //     address: addr,
                              //     amount: _amountCtrl.text,
                              //     currency: currency,
                              //     cryptoprice: cryptoprice,
                              //     orderRef: code,
                              //     unit: type,
                              //   ),
                              // ),
                            );
                            // print(address);
                            print(value);
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      title: "Create Request",
                      horizontalMult: 2.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getAddress(String val) {
    switch (val) {
      case "BTC":
        return BITCOIN;
        break;
      case "ETH":
        return ETHEREUM;
        break;
      case "DOGE":
        return DOGECOIN;
        break;
      case "LTC":
        return LITECOIN;
      case "BCH":
        return BITCOIN_CASH;
      case "DAI":
        return DAI;
      case "USDC":
        return USDC;
        break;
      default:
        return BITCOIN;
    }
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    this.itemBuilder,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: itemBuilder ??
          (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
