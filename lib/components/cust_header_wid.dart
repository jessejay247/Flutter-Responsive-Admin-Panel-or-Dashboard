import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustHeading extends StatelessWidget {
  const CustHeading({
    Key key,
    this.fontSize,
    @required this.title,
  }) : super(key: key);
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
        fontSize: fontSize,
      ),
    );
  }
}
