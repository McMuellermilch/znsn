import 'package:flutter/material.dart';
import 'package:znsn/components/simple_button.dart';
import 'package:znsn/components/simple_card.dart';
import 'package:znsn/components/bottom_button.dart';
import 'package:znsn/components/simple_empty_card.dart';
import 'package:znsn/constants.dart';
import 'package:znsn/components/simple_text.dart';
import 'package:znsn/resultpage.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int budget = 0;
  int rate = 0;
  int yield = 0;
  int years = 0;
  int compoundingInterval = 12;

  //[ P(1+r/n)^(nt)]
  double compoundInterestForPrincipal() {
    return (budget *
        pow((1 + ((yield / 100) / compoundingInterval)),
            (compoundingInterval * years)));
  }

  //[ PMT × ( ((1 + r/n)^(nt) - 1) / (r/n) ) ]
  double futureValueOfSeries() {
    return rate *
        (pow((1 + ((yield / 100) / compoundingInterval)),
                compoundingInterval * yield) -
            1) /
        ((yield / 100) / compoundingInterval);
  }

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
              title: "Startbudget",
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SimpleText(
                    numberValue: budget,
                    text: '€',
                    style: kNumberValueTextStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kBottomContainerColorLight,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: budget.toDouble(),
                      divisions: 1000,
                      min: 0.0,
                      max: 100000.00,
                      onChanged: (double newValue) {
                        setState(() {
                          budget = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SimpleCard(
              title: "Sparrate",
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SimpleText(
                    numberValue: rate,
                    text: '€ /Monat',
                    style: kNumberValueTextStyle,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kBottomContainerColorLight,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: rate.toDouble(),
                      divisions: 100,
                      min: 0.0,
                      max: 20000.00,
                      onChanged: (double newValue) {
                        setState(() {
                          rate = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: SimpleCard(
                    title: "Ausschüttungsintervall",
                    cardChild: Row(
                      children: <Widget>[
                        Expanded(
                          child: SimpleEmptyCard(
                            text: "Monatlich",
                            color: compoundingInterval == 12
                                ? kBottomContainerColor
                                : kInactiveCardColor,
                            onTap: () {
                              setState(() {
                                compoundingInterval = 12;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: SimpleEmptyCard(
                            text: "Jährlich",
                            color: compoundingInterval == 1
                                ? kBottomContainerColor
                                : kInactiveCardColor,
                            onTap: () {
                              setState(() {
                                compoundingInterval = 1;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: SimpleCard(
                    title: "Rendite",
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SimpleText(
                          numberValue: yield,
                          text: '% p.a.',
                          style: kNumberValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SimpleButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    yield--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SimpleButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(
                                  () {
                                    yield++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SimpleCard(
                    title: "Anlagedauer",
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SimpleText(
                          numberValue: years,
                          text: 'Jahre',
                          style: kNumberValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SimpleButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    years--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SimpleButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(
                                  () {
                                    years++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      budget: budget,
                      //TODO combining initial compounding interest and future deposits doesn't work yet
                      compoundInterest: compoundInterestForPrincipal() +
                          futureValueOfSeries(),
                      years: years,
                    ),
                  ),
                );
              },
              buttonTitle: "Berechnen")
        ],
      ),
    );
  }
}
