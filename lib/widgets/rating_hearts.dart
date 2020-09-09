import 'package:flutter/material.dart';

class RatingHearts extends StatelessWidget {
  final int rating;
  RatingHearts(this.rating);

  @override
  Widget build(BuildContext context) {
    String hearts = '';
    for (int i = 0; i < rating; i++) {
      hearts += '🧡 ';
      hearts.trim();
    }
    return Text(
      hearts,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
