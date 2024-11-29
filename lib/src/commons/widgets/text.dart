import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final double? fontsize;
  final String text;
  final Color? color;
  final bool bold;

  TextView(
      {Key? key,
      required this.text,
      required this.color,
      required this.bold,
      required this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: bold ? FontWeight.bold : null,
          color: color,
          fontFamily: "mainfont",
          
          fontSize: fontsize),
    );
  }
}
