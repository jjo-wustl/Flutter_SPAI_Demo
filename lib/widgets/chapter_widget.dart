import 'package:flutter/material.dart';
import 'volume_card.dart';

class ChapterWidget extends StatelessWidget {
  final String chapterTitle;
  final List<Map<String, dynamic>> volumes;

  ChapterWidget({
    required this.chapterTitle,
    required this.volumes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            chapterTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 200, // Set a fixed height for the row of volume cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: volumes.length,
            itemBuilder: (context, index) {
              final volume = volumes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: VolumeCard(
                  title: volume['title'],
                  subtitle: volume['subtitle'],
                  correct: volume['correct'],
                  total: volume['total'],
                  buttonText1: volume['buttonText1'],
                  buttonText2: volume['buttonText2'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
