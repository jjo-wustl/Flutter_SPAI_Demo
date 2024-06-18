import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/attendance_widget.dart';
import '../widgets/lessons_content.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DashboardContent(),
    LessonsContent(),
    Text('My Notes'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'My Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardContent extends StatefulWidget {
  @override
  _DashboardContentState createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  bool _showCalendar = false;

  void _toggleCalendarVisibility() {
    setState(() {
      _showCalendar = !_showCalendar;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isSmallScreen = screenSize.width < 600;

    return SingleChildScrollView(
      child: Column(
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
          GestureDetector(
            onTap: _toggleCalendarVisibility,
            child: AttendanceWidget(), // attendance widget
          ),
          if (_showCalendar)
            Column(
              children: [
                CalendarWidget(),
                ElevatedButton(
                  onPressed: _toggleCalendarVisibility,
                  child: Text('Close Calendar'),
                ),
              ],
            ),
          GridView.count(
            crossAxisCount: isSmallScreen ? 2 : 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              _buildGridItem('My Lessons'),
              _buildGridItem('SPA Test'),
              _buildGridItem('Daily Vocab'),
              _buildGridItem('BLOG'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String title) {
    return Card(
      elevation: 2.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    // Show the detailed view
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendance Summary'),
          content: AttendanceSummary(selectedDay: _selectedDay),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class AttendanceSummary extends StatelessWidget {
  final DateTime selectedDay;

  AttendanceSummary({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Date: ${selectedDay.toLocal()}'.split(' ')[0]),
        SizedBox(height: 16.0),
        Text('Attendance Details:'),
        // Add your detailed attendance information here
        Text('Present: 21 days'),
        Text('Leave(s): 2.5 days'),
        Text('Absent: 1 day'),
        // More details as needed
      ],
    );
  }
}

class CalendarDetails extends StatelessWidget {
  final DateTime selectedDay;

  CalendarDetails({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    // Here, you would retrieve the actual data for the selected day.
    // For this example, we are using static data.

    return Column(
      children: [
        Text('Detailed attendance for ${selectedDay.toLocal()}'.split(' ')[0]),
        SizedBox(height: 16.0),
        Table(
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(3),
          },
          border: TableBorder.all(color: Colors.grey),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Date'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedDay.toLocal().toString().split(' ')[0]),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Status'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Present'), // This should be dynamic based on the actual status
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Remarks'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No remarks'), // This should be dynamic based on actual remarks
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
