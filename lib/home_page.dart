import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habit/habit.dart';
import 'package:habit/create_habit.dart';

import 'habit_detail_page.dart';
import 'progress_tracking_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Habit> habits = [];

  @override
  void initState() {
    super.initState();
    loadHabits();
  }

  void loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getString('habits');

    if (habitsJson != null) {
      setState(() {
        habits = Habit.habitsFromJson(habitsJson);
      });
    }
  }

  void saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = Habit.habitsToJson(habits);
    prefs.setString('habits', habitsJson);
  }

  void addHabit(Habit habit) {
    setState(() {
      habits.add(habit);
    });
    saveHabits();
  }

  void deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
    saveHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Dismissible(
            key: Key(habit.id),
            onDismissed: (_) => deleteHabit(index),
            background: Container(color: Colors.red),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HabitProgressPage(habit: habit),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(habit.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Due Date: ${habit.dueDate.year}-${habit.dueDate.month}-${habit.dueDate.day}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(habit.description),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateHabitPage()),
          ).then((habit) {
            if (habit != null) {
              addHabit(habit);
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
