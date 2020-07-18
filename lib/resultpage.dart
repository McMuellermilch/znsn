import 'package:flutter/material.dart';
import 'package:znsn/constants.dart';
import 'package:znsn/components/simple_button.dart';
import 'package:znsn/components/simple_result_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.budget, @required this.compoundInterest});

  final int budget;
  final double compoundInterest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZNSN"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
