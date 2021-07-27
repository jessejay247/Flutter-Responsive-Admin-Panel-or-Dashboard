import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustTextBox extends StatelessWidget {
  const CustTextBox({
    Key key,
    this.controller,
    this.hintText,
    this.width,
    this.enabled,
    this.readOnly,
    this.maxLines,
    this.prefixText,
    this.suffixText,
    this.fillColor,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.style,
    this.counter,
    this.counterText,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.textAlign,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double width;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final String prefixText;
  final String suffixText;
  final Color fillColor;
  final Function(String) onChanged;
  final String Function(String) validator;
  final bool obscureText;
  final Widget suffixIcon;
  final TextStyle style;
  final TextAlign textAlign;

  final List<TextInputFormatter> inputFormatters;
  final int maxLength;
  final TextInputType keyboardType;
  final Widget counter;
  final String counterText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        maxLines: maxLines ?? 1,
        enabled: enabled,
        readOnly: readOnly ?? false,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        style: style,
        maxLength: maxLength ?? null,
        keyboardType: keyboardType ?? null,
        inputFormatters: inputFormatters ?? null,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.only(left: 10, right: 10),
          prefixText: prefixText,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          fillColor: fillColor ?? secondaryColor,
          filled: true,
          hintStyle: TextStyle(color: primaryColor),

          counterText: counterText,
          counter: counter,

          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            // borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          // suffixIcon: InkWell(
          //   onTap: () {},
          //   child: Container(
          //     padding: EdgeInsets.all(defaultPadding * 0.75),
          //     margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          //     decoration: BoxDecoration(
          //       color: primaryColor,
          //       borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     ),
          //     child: SvgPicture.asset("assets/icons/Search.svg"),
          //   ),
          // ),
        ),
      ),
    );
  }
}
