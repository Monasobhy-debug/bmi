import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.textButton, this.onTap});
  final String textButton;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: green),
        child: Center(
          child: Text(
            textButton,
            style: kLargeButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        width: double.infinity,
        height: 50.0,
      ),
    );
  }
}
