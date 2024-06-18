import 'package:flutter/material.dart';
import 'score_indicator.dart';

class VolumeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int correct;
  final int total;
  final String buttonText1;
  final String buttonText2;

  VolumeCard({
    required this.title,
    required this.subtitle,
    required this.correct,
    required this.total,
    required this.buttonText1,
    required this.buttonText2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(subtitle),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScoreIndicator(
              correct: correct,
              total: total,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(buttonText1),
              ),
              TextButton(
                onPressed: () {},
                child: Text(buttonText2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
