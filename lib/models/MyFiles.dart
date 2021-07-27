import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String svgSrc, title, totalStorage;
  final int amount, percentage;
  final Color color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.amount,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Wallet Balance",
    amount: 1328,
    svgSrc: "assets/svgs/purse.svg",
    // totalStorage: "1.9GB",
    color: primaryColor,
    // percentage: 35,
  ),
  CloudStorageInfo(
    title: "Compound Profit",
    amount: 1328,
    svgSrc: "assets/svgs/profits.svg",
    // totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    // percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Deposit",
    amount: 1328,
    svgSrc: "assets/svgs/stack-of-coins.svg",
    // totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    // percentage: 10,
  ),
  CloudStorageInfo(
    title: "Total Withdraw",
    amount: 5328,
    svgSrc: "assets/svgs/withdrawal.svg",
    // totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    // percentage: 78,
  ),
];
