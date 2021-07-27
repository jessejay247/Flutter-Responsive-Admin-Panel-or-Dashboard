import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/components/my_trxn.dart';
import 'package:admin/components/news-widget.dart';
import 'package:admin/components/storage_details.dart';
import 'package:admin/components/trxnTable.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:flutter/material.dart';

class InvestmentPageContent extends StatelessWidget {
  const InvestmentPageContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Responsive(
      mobile: FileInfoCardGridView(
        crossAxisCount: _size.width < 500 ? 1 : 2,
        childAspectRatio: _size.width < 500
            ? 0.5
            : _size.width < 650
                ? 0.4
                : 0.6,
        itemBuilder: (context, index) => PlanContainer(),
      ),
      tablet: FileInfoCardGridView(
        childAspectRatio: 0.5,
        crossAxisCount: 3,
        itemBuilder: (context, index) => PlanContainer(),
      ),
      desktop: FileInfoCardGridView(
        crossAxisCount: _size.width < 1400 ? 3 : 4,
        childAspectRatio: _size.width < 1400 ? 0.59 : 0.56,
        itemBuilder: (context, index) => PlanContainer(),
      ),
    );
  }
}

class PlanContainer extends StatelessWidget {
  const PlanContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustContainer(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustHeading(
          title: "Basic",
          fontSize: 22,
        ),
        SizedBox(height: defaultPadding),
        CustHeading(
          title: "USD 5,000",
          fontSize: 18,
        ),
        SizedBox(height: defaultPadding * 0.2),
        Text("4% Daily"),
        Text("Runs for 30 Days"),
        Text("100,000USD Maximum Deposit"),
        Text("20% Return on Investment"),
        Text("3% Referral Bonus"),
        Text("8% Investment Bonus"),
        Text("Access to Profit anytime"),
        Text("Recurring capital investment"),
        SizedBox(height: defaultPadding),
        CustButton(
          icon: Icons.shop_outlined,
          onPressed: () {},
          title: "Purchase Plan",
          horizontalMult: 2,
        ),
        SizedBox(height: defaultPadding),
        Text(
            "Here a quick summary; Money invested 5000USD, ROI will be 1000USD, Compound Interest will amount to 6000USD after 30 Days . You will receive 8% of Compound Interest as Bonus"),
      ],
    );
  }
}
