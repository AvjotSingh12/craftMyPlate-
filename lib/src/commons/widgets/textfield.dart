
import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final double? height;
  final double? width;
  TextEditingController? controller;
  final String? hinttext;
  final String? p;

  final Icon? prefixIcon;

  textfield(
      {Key? key,
      this.prefixIcon,
      this.controller,
      this.height,
      this.hinttext,
      this.width,
      this.p})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: height ?? 40,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.8, color: Colors.black),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixText: p,
          prefixStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
          prefix: prefixIcon, // Changed to prefixIcon
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
