import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class SimpleText extends StatelessWidget {
  SimpleText({this.numberValue, this.text, this.style, @required this.simple});

  final int numberValue;
  final String text;
  final TextStyle style;
  final bool simple;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          simple == true
              ? numberValue.toString()
              : numberValue.toStringAsFixed(2),
          style: style,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          text,
          style: TextStyle(
              color:
                  style == kYieldValueTextStyle ? Colors.green : Colors.white),
        ),
      ],
    );
  }
}
