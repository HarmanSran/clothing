import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TaskData taskData, child) {
      return ListView.builder(
        itemCount: taskData.taskCount,
        itemBuilder: (context, index) {
          return TaskTile(
            isChecked: taskData.tasks[index].isDone,
            taskTitle: taskData.tasks[index].name,
            onToggle: (newValue) => taskData.updateTask(taskData.tasks[index]),
            onLongPress: () => taskData.deleteTask(index),
          );
        },
      );
    });
  }
}
