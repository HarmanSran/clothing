import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          taskTitle: tasks[index].name,
          onToggle: (newValue) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
