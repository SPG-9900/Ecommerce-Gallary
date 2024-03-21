import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final Color starColor;

  const RatingStars({
    Key? key,
    required this.rating,
    this.starColor = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int filledStars = rating.floor();
    final double fraction = rating - filledStars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          if (index < filledStars) {
            return Icon(Icons.star, color: starColor);
          } else if (index == filledStars && fraction > 0) {
            return Icon(Icons.star_half, color: starColor);
          } else {
            return Icon(Icons.star_border, color: starColor);
          }
        },
      ),
    );
  }
}
