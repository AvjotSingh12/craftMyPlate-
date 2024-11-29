import 'package:flutter/material.dart';

// ignore: must_be_immutable
class clipwidget extends StatelessWidget {
  clipwidget({
    super.key,
    required this.h,
    required this.w,
    required this.h1,
    required this.w1,
  });

  final double h;
  final double w;
  double h1;
  double w1;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomRectangleClipper(),
      child: Container(
        height: h / 5,
        width: w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: Offset(0, 1),
              blurRadius: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width - 70, size.height);
    path.quadraticBezierTo(
        size.width - 55, size.height, size.width - 50, size.height - 15);

    path.lineTo(size.width - 50, size.height - 30);

    path.quadraticBezierTo(
        size.width - 50, size.height - 45, size.width - 35, size.height - 50);

    path.lineTo(size.width - 20, size.height - 50);
    path.quadraticBezierTo(
        size.width, size.height - 50, size.width, size.height - 75);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
