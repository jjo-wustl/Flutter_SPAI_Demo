import 'package:flutter/material.dart';
import 'chapter_widget.dart';
import 'package:spai_demo_1/screens/lesson_detail_screen.dart';

class LessonsContent extends StatefulWidget {
  @override
  _LessonsContentState createState() => _LessonsContentState();
}

class _LessonsContentState extends State<LessonsContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'SPAI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Grammar'),
            Tab(text: 'Listening'),
            Tab(text: 'Vocab'),
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              GrammarTabContent(onRedoPressed: _navigateToLessonDetail),
              Center(child: Text('Listening Content')),
              Center(child: Text('Vocab Content')),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToLessonDetail() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LessonDetailScreen(),
    ));
  }
}

class GrammarTabContent extends StatelessWidget {
  final VoidCallback onRedoPressed;

  GrammarTabContent({required this.onRedoPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChapterWidget(
            chapterTitle: 'Prepositions',
            volumes: [
              {
                'title': 'PREPOSITIONS',
                'subtitle': 'Vol 1. Places',
                'correct': 10,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
                'onButton1Pressed': onRedoPressed,
              },
              {
                'title': 'PREPOSITIONS',
                'subtitle': 'Vol 2. Time',
                'correct': 8,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
                'onButton1Pressed': onRedoPressed,
              },
              // Add more volumes as needed
            ],
          ),
          ChapterWidget(
            chapterTitle: 'Articles',
            volumes: [
              {
                'title': 'ARTICLES',
                'subtitle': 'Vol 1. Definite',
                'correct': 9,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
                'onButton1Pressed': onRedoPressed,
              },
              {
                'title': 'ARTICLES',
                'subtitle': 'Vol 2. Indefinite',
                'correct': 6,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
                'onButton1Pressed': onRedoPressed,
              },
              // Add more volumes as needed
            ],
          ),
          // Add more chapters as needed
        ],
      ),
    );
  }
}