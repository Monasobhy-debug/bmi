import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconContent extends StatelessWidget {
  IconContent(
      {this.text, this.check, this.icon, this.color, this.border, this.onTap});
  final String text;
  final IconData icon;
  final IconData check;
  final Color color;
  final BoxBorder border;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xff4A4A4A),
          ),
          padding: EdgeInsets.only(top: 5.0, left: 25.0),
          height: 150,
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 60),
                  Text(
                    text,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Icon(
                Icons.check_circle,
                color: color,
              )
            ],
          )),
    );
  }
}
