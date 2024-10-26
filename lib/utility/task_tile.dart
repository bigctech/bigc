import 'package:bigc/utility/linear_progress_bar.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.task_progress,
      required this.task_deadline,
      required this.task_title});

  final double task_progress; // value between 0 to 1
  final String task_title;
  final String task_deadline;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(task_title), Text(task_deadline)],
              ),
            ),
            const Text("Progress:"),
            LinearProgressBar(
              progress: task_progress,
            )
          ],
        ),
      ),
    );
  }
}
