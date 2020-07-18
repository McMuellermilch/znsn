import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class SimpleText extends StatelessWidget {
  SimpleText({@required this.numberValue, @required this.text});

  final int numberValue;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          numberValue.toString(),
          style: kNumberValueTextStyle,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
