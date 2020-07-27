import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class NumberInputField extends StatelessWidget {
  NumberInputField(
      {@required this.value, @required this.changeHandler, this.fieldChild});

  final String value;
  final Function changeHandler;
  final Widget fieldChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeHandler,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "0.00"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              "€",
              style: kNumberValueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
