import 'dart:convert';

class Habit {
  String id;
  String name;
  String description;
  int goal;
  DateTime dueDate;
  int allocatedTime;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.goal,
    required this.dueDate,
    required this.allocatedTime,
  });

  static List<Habit> habitsFromJson(String json) {
    final List<dynamic> habitList = jsonDecode(json);
    return habitList.map((habitJson) {
      return Habit(
        id: habitJson['id'],
        name: habitJson['name'],
        description: habitJson['description'],
        goal: habitJson['goal'],
        dueDate: DateTime.parse(habitJson['dueDate']),
        allocatedTime: habitJson['allocatedTime'],
      );
    }).toList();
  }

  static String habitsToJson(List<Habit> habits) {
    final List<Map<String, dynamic>> habitList = habits.map((habit) {
      return {
        'id': habit.id,
        'name': habit.name,
        'description': habit.description,
        'goal': habit.goal,
        'dueDate': habit.dueDate.toIso8601String(),
        'allocatedTime': habit.allocatedTime,
      };
    }).toList();
    return jsonEncode(habitList);
  }
}
