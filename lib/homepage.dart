import 'package:flutter/material.dart';
import 'package:znsn/components/simple_card.dart';
import 'package:znsn/components/bottom_button.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZNSN"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: SimpleCard(
              title: "Budget",
              cardChild: Container(),
            ),
          ),
          Expanded(
            child: SimpleCard(
              title: "Rendite",
              cardChild: Container(),
            ),
          ),
          Expanded(
            child: SimpleCard(
              title: "Anlagedauer",
              cardChild: Container(),
            ),
          ),
          BottomButton(onTap: () {}, buttonTitle: "Rechnen")
        ],
      ),
    );
  }
}
