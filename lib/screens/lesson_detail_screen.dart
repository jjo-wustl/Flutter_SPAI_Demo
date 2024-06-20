import 'package:flutter/material.dart';
import 'lesson_video_screen.dart'; // Import the LessonVideoScreen

class LessonDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('[LC Drills Vol.1] Set 1-5.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/textbook_cover.png', // Ensure you have this image in your assets
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  color: Colors.yellowAccent,
                  child: Text(
                    'Med.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '60min.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'LC Drills Vol 1.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Passage Structure'),
            SizedBox(height: 8),
            Text('• Lesson introduction text'),
            Text('• Lesson introduction text'),
            Text('• Lesson introduction text'),
            SizedBox(height: 16), // Add some space before the button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LessonVideoScreen(),
                  ));
                },
                child: Text('BEGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
