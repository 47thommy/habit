import 'package:flutter/material.dart';
import 'package:habit/habit.dart';

class CreateHabitPage extends StatefulWidget {
  @override
  _CreateHabitPageState createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _goalController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final _allocatedTimeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _goalController.dispose();
    _allocatedTimeController.dispose();
    super.dispose();
  }

  void showDatePickerDialog(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        _dueDate = selectedDate;
      });
    }
  }

  void createHabit() {
    if (_formKey.currentState!.validate()) {
      final habit = Habit(
        id: DateTime.now().toString(),
        name: _nameController.text,
        description: _descriptionController.text,
        goal: int.parse(_goalController.text),
        dueDate: _dueDate,
        allocatedTime: int.parse(_allocatedTimeController.text),
      );

      Navigator.pop(context, habit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _goalController,
                decoration: InputDecoration(labelText: 'Goal'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a goal';
                  }
                  return null;
                },
              ),
              InkWell(
                onTap: () => showDatePickerDialog(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                  ),
                  child: Text(
                    '${_dueDate.year}-${_dueDate.month}-${_dueDate.day}',
                  ),
                ),
              ),
              TextFormField(
                controller: _allocatedTimeController,
                decoration: InputDecoration(labelText: 'Allocated Time'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter allocated time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: createHabit,
                child: Text('Create Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
