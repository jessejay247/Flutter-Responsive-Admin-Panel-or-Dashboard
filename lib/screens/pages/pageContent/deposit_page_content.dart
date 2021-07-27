import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/components/trxnTable.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:admin/screens/pages/pageContent/withdraw_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DepositPageContent extends StatelessWidget {
  const DepositPageContent({
    Key key,
    this.address,
    this.amount,
    this.currency,
    this.cryptoprice,
    this.orderRef,
    this.unit,
  }) : super(key: key);

  final String currency;
  final String unit;
  final amount;
  final cryptoprice;
  final String address;
  final String orderRef;
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Make Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                      "Your order $orderRef has been placed successfully. To complete, please send the exact amount of $cryptoprice $unit to the address below."),
                  SizedBox(height: defaultPadding),
                  Card(
                    // elevation: 5,
                    color: Colors.white10,
                    child: Container(
                      height: 680,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PAY ${currency.toUpperCase()}"),
                                Text("Expires in 1hr"),
                              ],
                            ),
                            Divider(
                              color: bgColor,
                              height: 40,
                            ),
                            QrImage(
                              data: address,
                              version: QrVersions.auto,

                              // embeddedImage: AssetImage(
                              //   "assets/images/rift-alliance.png",
                              // ),
                              size: 200.0,
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              "USD $amount ~ $cryptoprice  $unit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              "${currency.toUpperCase()} Address",
                            ),
                            SizedBox(height: defaultPadding),
                            CustTextBox(
                              enabled: false,
                              hintText: address,
                              suffixIcon: Icon(IconlyBroken.paper),
                            ),
                            SizedBox(height: defaultPadding),
                            CustButton(
                                onPressed: () => popTrxnHash(context),
                                title: "PAID ${currency.toUpperCase()}",
                                horizontalMult: 2),
                            SizedBox(height: defaultPadding / 2),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Pay Later",
                              ),
                            ),
                            SizedBox(height: defaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  IconlyBroken.infoCircle,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "This order will be cancelled, if you send wrong amount.",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: defaultPadding / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  IconlyBroken.infoCircle,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "Account will credited once we received your payment.",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: defaultPadding * 2),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Powered By ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'RIFT ALLIANCE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        )),
                                  ],
                                ),
                                // style:
                                //     TextStyle(color: Colors.red, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              // if (Responsive.isMobile(context)) RequestWithdrawWid(),
            ],
          ),
        ),
        // if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // if (!Responsive.isMobile(context))
        //   Expanded(
        //     flex: 2,
        //     child: RequestWithdrawWid(),
        //   ),
      ],
    );
  }

  popTrxnHash(context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Confirm your payment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  )),
              content: Container(
                height: 300,
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "If you already paid, please provide us your payment reference to speed up verification procces."),
                    SizedBox(height: defaultPadding),
                    Text("Payment Reference *",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: primaryColor,
                        )),
                    SizedBox(height: defaultPadding),
                    CustTextBox(
                      hintText: "Enter your reference ID/Hash",
                    ),
                    SizedBox(height: defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustButton(
                            onPressed: () {},
                            title: "Confirm Payment",
                            horizontalMult: 2),
                        InkWell(
                          hoverColor: transparent,
                          onTap: () {},
                          child: Text("Close"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
