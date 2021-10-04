import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function onToggle;

  const TasksList({
    Key? key,
    required this.tasks,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          taskTitle: tasks[index].name,
          onToggle: (newValue) => onToggle(index),
        );
      },
    );
  }
}
