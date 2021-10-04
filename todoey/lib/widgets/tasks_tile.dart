import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) onToggle;

  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: onToggle,
        value: isChecked,
      ),
    );
  }
}
