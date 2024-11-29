import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final bool icon;
  final Size size;

  const TopBar({
    super.key,
    required this.icon,
    required this.size,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double h = size.height;
    double w = size.width;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: h * 0.095, // Adjusted for responsive height
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),

        child: Container(
          height: h * 0.08, // Responsive height for the top bar
          padding: EdgeInsets.all(5), // Horizontal padding
          child: Stack(
            children: [
              // Back Button
              Positioned(
                top: 25, // Responsive positioning
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: h * 0.04, // Adjusted height
                    width: h * 0.04, // Square for back button
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(h * 0.025),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: h * 0.03, // Responsive icon size
                    ),
                  ),
                ),
              ),
              // Title
              Positioned(
                top: 25, // Responsive positioning
                left:
                    35, // Adjusted to center horizontally with space for back button
                // Adjusted based on whether the icon is present
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: h * 0.025, // Responsive font size
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Handle long titles
                  textAlign: TextAlign.left,
                ),
              ),
              // Optional Icon
              if (icon)
                Positioned(
                  top: h * 0.02, // Same as back button
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      // Implement your desired action here
                    },
                    child: Container(
                      height: h * 0.05, // Same as back button
                      width: h * 0.05, // Square for icon
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(h * 0.025),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: h * 0.03, // Responsive icon size
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
