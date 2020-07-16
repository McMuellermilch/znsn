import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  SimpleCard({@required this.title, @required this.cardChild});

  final String title;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0x26ABABAB),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: cardChild,
            ),
          ],
        ));
  }
}
