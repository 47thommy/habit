import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

class HabitStatisticsPage extends StatelessWidget {
  final Habit habit;

  const HabitStatisticsPage({required this.habit});

  @override
  Widget build(BuildContext context) {
    // Add your habit statistics UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Statistics'),
      ),
      body: Center(
        child: Text('View habit statistics here'),
      ),
    );
  }
}
