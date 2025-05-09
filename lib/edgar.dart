import 'package:flutter/material.dart';

void main() {
  runApp(const TimelineApp());
}

class TimelineApp extends StatelessWidget {
  const TimelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PersonalTasksScreen(),
    );
  }
}

class PersonalTasksScreen extends StatelessWidget {
  const PersonalTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home, size: 28),
              SizedBox(width: 40),
              Icon(Icons.person, size: 28),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 8),
            color: const Color(0xFF111111),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Personal tasks',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'You have 3 new tasks for today!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 24),
                // Day selector
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      dayItem('Sun', '24'),
                      dayItem('Mon', '25'),
                      dayItem('Tue', '26'),
                      dayItem('Wed', '27'),
                      dayItem('Thu', '28', selected: true),
                      dayItem('Fri', '29'),
                      dayItem('Sat', '30'),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Timeline section
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tasks',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Chip(label: Text('Timeline')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  timelineItem('9:00 am', Colors.red, Colors.redAccent,
                      'Go for a walk with dog', '9:00 - 10:00 am'),
                  timelineItem('10:00 am', Colors.blue, Colors.blueAccent,
                      'Shot on Dribbble', '10:00 - 12:00 am'),
                  timelineItem('2:00 pm', Colors.orange, Colors.orangeAccent,
                      'Call with client', '2:00 - 3:00 pm'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget dayItem(String day, String date, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white60,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              date,
              style: TextStyle(
                color: selected ? Colors.black : Colors.white70,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget timelineItem(String time, Color dotColor, Color cardColor,
      String title, String timeRange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(time, style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: dotColor, shape: BoxShape.circle),
                  ),
                  Container(
                      width: 2, height: 60, color: dotColor.withOpacity(0.5)),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(timeRange,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
