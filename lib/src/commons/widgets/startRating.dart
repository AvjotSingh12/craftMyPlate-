import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int? maxStars;
  final double? starSize;
  final Color? filledStarColor;
  final Color? unfilledStarColor;

  const StarRating({
    super.key,
    this.maxStars,
    this.starSize,
    this.filledStarColor,
    this.unfilledStarColor,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _selectedRating = 0;

  void _handleStarTap(int index) {
    setState(() {
      _selectedRating = index + 1; // Set the rating based on the star tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars ?? 5, (index) {
        return GestureDetector(
          onTap: () => _handleStarTap(index),
          child: Icon(
            Icons.star,
            color: index < _selectedRating
                ? widget.filledStarColor
                : widget.unfilledStarColor,
            size: widget.starSize,
          ),
        );
      }),
    );
  }
}
