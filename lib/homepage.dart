import 'package:flutter/material.dart';
import 'package:znsn/components/simple_button.dart';
import 'package:znsn/components/simple_card.dart';
import 'package:znsn/components/bottom_button.dart';
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

  double compoundInterest() {
    return budget * pow((1 + (yield / 100)), years);
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
                  SimpleText(numberValue: budget, text: '€'),
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
                  SimpleText(numberValue: rate, text: '€ /Monat'),
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
              children: <Widget>[
                Expanded(
                  child: SimpleCard(
                    title: "Rendite",
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SimpleText(numberValue: yield, text: '% p.a.'),
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
                        SimpleText(numberValue: years, text: 'Jahre'),
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
                      compoundInterest: compoundInterest(),
                    ),
                  ),
                );
              },
              buttonTitle: "Rechnen")
        ],
      ),
    );
  }
}
