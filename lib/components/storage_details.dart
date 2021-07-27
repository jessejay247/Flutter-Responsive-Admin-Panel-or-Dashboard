import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'storage_info_card.dart';

class TotalTransactions extends StatelessWidget {
  const TotalTransactions({
    Key key,
  }) : super(key: key);

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
            "Transaction Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(height: defaultPadding),
          // Chart(),
          StorageInfoCard(
            svgSrc: "assets/svgs/profits.svg",
            title: "Total Compounded",
            // amountOfFiles: "1.3GB",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/svgs/invest.svg",
            title: "Total Investment Made",
            // amountOfFiles: "15.3GB",
            numOfFiles: 2000,
          ),
          StorageInfoCard(
            svgSrc: "assets/svgs/refer.svg",
            title: "Total Referred",
            isRefered: true,
            // amountOfFiles: "1.3GB",
            numOfFiles: 0,
          ),
          // StorageInfoCard(
          //   svgSrc: "assets/icons/unknown.svg",
          //   title: "Total Referred",
          //   amountOfFiles: "1.3GB",
          //   numOfFiles: 140,
          // ),
        ],
      ),
    );
  }
}
