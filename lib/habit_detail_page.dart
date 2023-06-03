import 'package:flutter/material.dart';
import 'package:habit/habit.dart';
import 'package:habit/progress_tracking_page.dart';
import 'package:habit/reminders_page.dart';
import 'package:habit/habit_notes_page.dart';
import 'package:habit/habit_statistics_page.dart';

class HabitDetailPage extends StatelessWidget {
  final Habit habit;

  const HabitDetailPage({required this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Detail'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Progress Tracking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgressTrackingPage(habit: habit),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Reminders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RemindersPage(habit: habit),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Habit Notes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HabitNotesPage(habit: habit),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Habit Statistics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HabitStatisticsPage(habit: habit),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
