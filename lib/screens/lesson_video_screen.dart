import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'lesson_listening_drills.dart';

class LessonVideoScreen extends StatelessWidget {
  final String videoId = 'XO41hI933WU'; // YouTube video ID

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('[LC Drills Vol.1] Passage Structure'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = 600.0; // Set your max width here
                    double width = constraints.maxWidth > maxWidth
                        ? maxWidth
                        : constraints.maxWidth;
                    return Center(
                      child: Container(
                        width: width,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            onReady: () {
                              print('Player is ready.');
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'LC Drills Vol 1.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Passage Structure'),
                SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lesson content text'),
                        Text('Lesson content text'),
                        SizedBox(height: 8),
                        Text('• Lesson content text'),
                        Text('• Lesson content text'),
                        Text('• Lesson content text'),
                        Text('• Lesson content text'),
                        SizedBox(height: 60), // Add some space for floating button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Add bookmark logic here
                  },
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListeningScreen(),
                    ));
                  },
                  child: Text('NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}