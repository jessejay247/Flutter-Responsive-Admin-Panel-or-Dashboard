import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/components/trxnTable.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class ReferralPageContent extends StatelessWidget {
  const ReferralPageContent({Key key}) : super(key: key);

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
                  TrxnTable(
                    title: "Referrals History",
                  ),
                ],
              ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) RefCountWid(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: RefCountWid(),
          )
      ],
    );
  }
}

class RefCountWid extends StatelessWidget {
  const RefCountWid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustContainer(
          children: [
            Center(
              child: Text(
                "Referral",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text("USD 0"),
          ],
        ),
        SizedBox(height: defaultPadding),
        CustContainer(
          children: [
            Center(
              child: Text(
                "Referral",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            Text(
                "Automatically Top up your Balance by Sharing your Referral Link, Earn a percentage of whatever Plan your Referred user Buys."),
            SizedBox(height: defaultPadding),
            CustTextBox(
              readOnly: true,
              hintText: "https://riftalliance.com/invite/2341920",
              // width: 300.0,
            ),
            SizedBox(height: defaultPadding),
            Center(
              child: CustButton(
                icon: Icons.link_outlined,
                onPressed: () => FlutterClipboard.copy('hello flutter friends')
                    .then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Ref Link Copied"),
                          duration: Duration(seconds: 3),
                          backgroundColor: Theme.of(context).primaryColor,
                        ))),
                title: "Copy Link",
                horizontalMult: 2.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
