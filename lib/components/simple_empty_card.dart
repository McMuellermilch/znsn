import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class SimpleEmptyCard extends StatelessWidget {
  SimpleEmptyCard({@required this.text, this.onTap, this.color});

  final String text;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: kEmptyCardText,
          ),
        ),
      ),
    );
  }
}
