import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton(
      {@required this.shape,
      @required this.onPressed,
      this.fillColor,
      this.icon,
      this.text});

  final String text;
  final IconData icon;
  final Function onPressed;
  final ShapeBorder shape;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: text == null ? Icon(icon) : Text(text),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: shape,
      fillColor: fillColor == null ? kBottomContainerColor : fillColor,
    );
  }
}
