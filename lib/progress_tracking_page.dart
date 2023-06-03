import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

class HabitProgressPage extends StatefulWidget {
  final Habit habit;

  HabitProgressPage({required this.habit});

  @override
  _HabitProgressPageState createState() => _HabitProgressPageState();
}

class _HabitProgressPageState extends State<HabitProgressPage> {
  int progress = 0;

  void incrementProgress() {
    setState(() {
      progress++;
    });
  }

  void decrementProgress() {
    setState(() {
      progress--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description: ${widget.habit.description}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Progress: $progress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrementProgress,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: incrementProgress,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
