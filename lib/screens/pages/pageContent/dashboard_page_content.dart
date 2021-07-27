import 'package:admin/backend/backend_repo.dart';
import 'package:admin/components/my_trxn.dart';
import 'package:admin/components/news-widget.dart';
import 'package:admin/components/storage_details.dart';
import 'package:admin/components/trxnTable.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:flutter/material.dart';

class DashboardPageContent extends StatefulWidget {
  const DashboardPageContent({
    Key key,
  }) : super(key: key);

  @override
  _DashboardPageContentState createState() => _DashboardPageContentState();
}

class _DashboardPageContentState extends State<DashboardPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              MyTransactions(),
              SizedBox(height: defaultPadding),
              NewsContainer(),
              // SizedBox(height: defaultPadding),
              // TrxnTable(
              //   title: "Transactions",
              // ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) TotalTransactions(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // On Mobile means if the screen is less than 850 we dont want to show it
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: TotalTransactions(),
          ),
      ],
    );
  }
}
