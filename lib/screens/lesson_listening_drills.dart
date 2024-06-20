import 'package:flutter/material.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  bool isPlaying = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: 0.45, // Change this value to update progress
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
                SizedBox(height: 8),
                Text(
                  '45%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Listen Carefully',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Icon(
                  Icons.volume_up,
                  size: 100,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Full passage',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                IconButton(
                  iconSize: 50,
                  icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
                  onPressed: togglePlayPause,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation logic here
                },
                child: Text('NEXT'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
