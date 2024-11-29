
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontsize;
  final String? text;
  final Color? textcolor;
  final Color buttoncolor;
  final double? borderRadius;
  static const Color c = Colors.white;
  static const Color c2 = Color.fromARGB(255, 247, 213, 224);

  const Button({
    Key? key,
    required this.buttoncolor,
    required this.width,
    required this.textcolor,
    this.fontsize,
    required this.height,
    required this.text,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Use the height parameter
      width: width, // Use the width parameter
      decoration: BoxDecoration(
        color: buttoncolor,
        border: Border.all(
            color: buttoncolor == c || buttoncolor == c2
                ? Colors.black
                : Colors
                    .transparent), // Assuming primaryOrange is defined in your color file
        borderRadius: BorderRadius.circular(
            borderRadius ?? 1), // Use borderRadius parameter
      ),
      child: Center(
          child: Text(
        text ?? "",
        style: TextStyle(fontSize: fontsize ?? 20, color: textcolor),
      )),
    );
  }
}
