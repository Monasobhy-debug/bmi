import 'package:flutter/material.dart';
import 'package:bmi/constant.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.text, this.width, this.onPress1, this.onPress2});
  final String text;
  final double width;

  final onPress1;
  final onPress2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPress1,
            color: black,
            icon: Icon(
              Icons.remove_circle_outlined,
            ),
            disabledColor: black,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15, color: black),
          ),
          IconButton(
            onPressed: onPress2,
            icon: Icon(Icons.add_circle_outlined),
            color: black,
            iconSize: 20,
            disabledColor: black,
          ),
        ],
      ),
    );
  }
}
