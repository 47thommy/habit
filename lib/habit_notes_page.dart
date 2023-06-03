import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

class HabitNotesPage extends StatelessWidget {
  final Habit habit;

  const HabitNotesPage({required this.habit});

  @override
  Widget build(BuildContext context) {
    // Add your habit notes UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Notes'),
      ),
      body: Center(
        child: Text('Add and manage habit notes here'),
      ),
    );
  }
}
