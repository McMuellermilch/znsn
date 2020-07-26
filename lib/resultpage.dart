import 'package:flutter/material.dart';
import 'package:znsn/components/simple_text.dart';
import 'package:znsn/constants.dart';
import 'package:znsn/components/simple_button.dart';
import 'package:znsn/components/bottom_button.dart';
import 'package:znsn/components/simple_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.budget,
      @required this.compoundInterest,
      @required this.years});

  final int budget;
  final double compoundInterest;
  final int years;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SimpleCard(
                title: "Eingezahlt",
                cardChild: Column(
                  children: <Widget>[
                    SimpleText(
                      numberValue: budget,
                      text: "€",
                      style: kNumberValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SimpleCard(
                title: "Gesamtwert nach ${years} Jahren",
                cardChild: Column(
                  children: <Widget>[
                    SimpleText(
                      numberValue: compoundInterest.toInt(),
                      text: "€",
                      style: kNumberValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SimpleCard(
                title: "Rendite",
                cardChild: Column(
                  children: <Widget>[
                    SimpleText(
                      numberValue: compoundInterest.toInt() - budget,
                      text: "€",
                      style: kYieldValueTextStyle,
                    ),
                    SimpleText(
                      numberValue:
                          (compoundInterest.toInt() - budget) ~/ (budget / 100),
                      text: "%",
                      style: kYieldValueTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: "Neu berechnen"),
          ],
        ),
      ),
    );
  }
}
