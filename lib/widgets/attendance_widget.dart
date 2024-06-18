import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; // package for circular percent indicator

class AttendanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'ATTENDANCE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: 10 / 12, // placeholder for now, this should be dynamic
                center: Text("10/12"),
                progressColor: Colors.blue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Center(child: Text('Sun')),
                        Center(child: Text('Mon')),
                        Center(child: Text('Tue')),
                        Center(child: Text('Wed')),
                        Center(child: Text('Thu')),
                        Center(child: Text('Fri')),
                        Center(child: Text('Sat')),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(child: Text('17')),
                        Center(child: Text('18')),
                        Center(child: Text('19')),
                        Center(child: Text('20')),
                        Center(child: Text('21')),
                        Center(child: Text('22')),
                        Container(
                          color: Colors.teal,
                          child: Center(child: Text('23')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
