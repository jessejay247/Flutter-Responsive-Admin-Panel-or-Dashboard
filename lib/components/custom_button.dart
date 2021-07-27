import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  const CustButton({
    Key key,
    this.icon,
    @required this.onPressed,
    @required this.title,
    @required this.horizontalMult,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() onPressed;
  final double horizontalMult;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * horizontalMult,
          vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
        ),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Text(title),
              ],
            )
          : Text(title),
      onPressed: onPressed,
    );
  }
}
