import 'package:bmi/componant/botton_bottom.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {this.bimResult,
      this.resultText,
      this.interpretation,
      this.weightUnit,
      this.heightUnit});
  final resultText;
  final bimResult;
  final interpretation;
  final weightUnit;
  final heightUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOur Result'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xff4A4A4A),
                  ),
                  padding: EdgeInsets.only(top: 5.0, left: 25.0),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        resultText,
                        style: kBmiTextStyle,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            bimResult,
                            style: kResultTextStyle,
                          ),
                          Text(weightUnit + '\\' + heightUnit),
                        ],
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                textButton: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
