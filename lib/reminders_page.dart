import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

class RemindersPage extends StatelessWidget {
  final Habit habit;

  const RemindersPage({required this.habit});

  @override
  Widget build(BuildContext context) {
    // Add your reminders UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Center(
        child: Text('Set reminders for your habit here'),
      ),
    );
  }
}
