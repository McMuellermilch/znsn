import 'package:flutter/cupertino.dart';
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
  int monthlyPayment = 0;
  int yield = 0;
  int years = 0;
  int compoundingInterval = 12;

  double compoundInterestForPrincipal() {
    return (budget *
        pow((1 + ((yield / 100) / compoundingInterval)),
            (compoundingInterval * years)));
  }

  double futureValueOfSeries() {
    return monthlyPayment *
        ((pow((1 + ((yield / 100) / compoundingInterval)),
                compoundingInterval * years)) -
            1) /
        ((yield / 100) / compoundingInterval);
  }

  int sumPayments() {
    return (years * 12) * monthlyPayment;
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
                  GestureDetector(
                    onTap: () {
                      print("gedrückt");
                    },
                    child: SimpleText(
                      numberValue: budget,
                      text: '€',
                      style: kNumberValueTextStyle,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kBottomContainerColorLight,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
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
                    numberValue: monthlyPayment,
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
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: monthlyPayment.toDouble(),
                      divisions: 100,
                      min: 0.0,
                      max: 5000.00,
                      onChanged: (double newValue) {
                        setState(() {
                          monthlyPayment = newValue.round();
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
                          simple: true,
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
                          simple: true,
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
                if (budget > 0 || sumPayments() > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        budget: budget + sumPayments(),
                        compoundInterest: compoundInterestForPrincipal() +
                            futureValueOfSeries(),
                        years: years,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                            title: Text("Ohoh"),
                            content: Text(
                                "Bitte ein Startbudget oder Sparrate eingeben"));
                      });
                }
              },
              buttonTitle: "Berechnen")
        ],
      ),
    );
  }
}
