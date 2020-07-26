import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';

class NumberInputField extends StatelessWidget {
  NumberInputField({@required this.value, @required this.changeHandler});

  final String value;
  final Function changeHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 100),
          Expanded(
            child: Container(
              width: 100.0,
              //padding: EdgeInsets.all(),
              child: TextField(
                onChanged: changeHandler(),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(value),
          SizedBox(width: 100),
        ],
      ),
    );
  }
}
