import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TransactionPageContent extends StatefulWidget {
  const TransactionPageContent({Key key}) : super(key: key);

  @override
  _TransactionPageContentState createState() => _TransactionPageContentState();
}

class _TransactionPageContentState extends State<TransactionPageContent>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
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
              CustContainer(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor,
                        ),
                    child: TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Theme.of(context).primaryColor,
                      controller: _controller,
                      tabs: [
                        Tab(
                          text: 'Investments',
                          // child: TrxnTable(),
                        ),
                        Tab(
                          text: 'Withdrawals',
                        ),
                        Tab(
                          text: 'Deposits',
                        ),
                        Tab(
                          text: 'Referral Bonuses',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 550,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        TrxnTable(),
                        TrxnTable(),
                        TrxnTable(),
                        TrxnTable(),
                      ],
                    ),
                  ),
                  // if (_controller.index == 0)
                  //   TrxnTable(
                  //     title: "1",
                  //   )
                  // else if (_controller.index == 1)
                  //   TrxnTable(
                  //     title: "2",
                  //   )
                  // else if (_controller.index == 2)
                  //   TrxnTable(
                  //     title: "3",
                  //   )
                  // else if (_controller.index == 3)
                  //   TrxnTable(
                  //     title: "4",
                  //   ),
                ],
              ),
            ],
          ),
        ),
        // if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // if (!Responsive.isMobile(context))
        //   Expanded(
        //     flex: 2,
        //     child: Container(),
        //   ),
      ],
    );
  }
}

class TrxnTable extends StatelessWidget {
  const TrxnTable({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Reference ID"),
                ),
                DataColumn(
                  label: Text("Amount"),
                ),
                DataColumn(
                  label: Text("Status"),
                ),
                DataColumn(
                  label: Text("Start Date"),
                ),
                DataColumn(
                  label: Text("End Date"),
                ),
              ],
              rows: List.generate(
                trxns.length,
                (index) => trxnDataRow(trxns[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow trxnDataRow(TrxnsDetails fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            // SvgPicture.asset(
            //   fileInfo.icon,
            //   height: 30,
            //   width: 30,
            // ),
            Text(fileInfo.refId),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            //   child: Text(fileInfo.title),
            // ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.amount)),
      DataCell(Text(fileInfo.status)),
      DataCell(Text(fileInfo.date)),
      DataCell(Text(fileInfo.endDate)),
    ],
  );
}
