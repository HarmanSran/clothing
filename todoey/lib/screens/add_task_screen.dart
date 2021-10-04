import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  String text = '';
  final Function addTask;

  AddTaskScreen({
    Key? key,
    required this.addTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                text = newText;
              },
            ),
            ElevatedButton(
              onPressed: () {
                addTask(text);
                Navigator.pop(context);
              },
              child: const Text('Add'),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
