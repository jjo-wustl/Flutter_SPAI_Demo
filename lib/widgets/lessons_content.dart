import 'package:flutter/material.dart';
import 'chapter_widget.dart';

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
              GrammarTabContent(),
              Center(child: Text('Listening Content')),
              Center(child: Text('Vocab Content')),
            ],
          ),
        ),
      ],
    );
  }
}

class GrammarTabContent extends StatelessWidget {
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
              },
              {
                'title': 'PREPOSITIONS',
                'subtitle': 'Vol 2. Time',
                'correct': 8,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
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
              },
              {
                'title': 'ARTICLES',
                'subtitle': 'Vol 2. Indefinite',
                'correct': 6,
                'total': 12,
                'buttonText1': 'Redo',
                'buttonText2': 'Review',
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
