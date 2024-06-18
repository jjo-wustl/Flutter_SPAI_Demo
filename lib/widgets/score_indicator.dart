import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScoreIndicator extends StatelessWidget {
  final int correct;
  final int total;

  ScoreIndicator({required this.correct, required this.total});

  @override
  Widget build(BuildContext context) {
    double percentage = correct / total;

    return Container(
      width: 80.0,
      height: 80.0,
      child: CircularPercentIndicator(
        radius: 40.0,
        lineWidth: 8.0,
        percent: percentage,
        center: Text("$correct/$total"),
        progressColor: Colors.blue,
      ),
    );
  }
}
