import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final bool border;
  final Offset shadowOffset;

  ReusableContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.border,
    this.borderRadius = 17.8,
    this.spreadRadius = 1.0,
    this.blurRadius = 1.0,
    this.shadowOffset = const Offset(0, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color:
            Colors.white, // Optional: a background color for better visibility
        borderRadius: BorderRadius.circular(borderRadius),

        border: border ? Border.all(width: 1, color: Colors.black) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: shadowOffset, // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
