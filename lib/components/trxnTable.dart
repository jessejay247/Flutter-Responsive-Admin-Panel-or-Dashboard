import 'package:admin/helpers/constants.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrxnTable extends StatelessWidget {
  const TrxnTable({
    Key key,
    @required this.title,
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
            title,
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
                  label: Text("Date"),
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
      DataCell(Text(fileInfo.date)),
      DataCell(Text(fileInfo.amount)),
      DataCell(Text(fileInfo.amount)),
    ],
  );
}
