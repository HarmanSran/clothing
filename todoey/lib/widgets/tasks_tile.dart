import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) onToggle;
  final Function() onLongPress;

  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.onToggle,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
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
