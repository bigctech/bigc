import 'package:bigc/models/task_model.dart';
import 'package:bigc/screens/home/add_task_screen.dart';
import 'package:bigc/utility/task_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TaskModel> tasks = [
    TaskModel(
        title: "Make flutter app", progress: 0.25, difficulty: Difficulty.hard),
    TaskModel(
        title: "Make Website", progress: 0, difficulty: Difficulty.medium),
    TaskModel(
        title: "PPT Presentation", progress: 0.75, difficulty: Difficulty.easy),
    TaskModel(
        title: "Frontend Designs",
        progress: 0.25,
        difficulty: Difficulty.medium),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Home",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const Text(
              'Welcome back, John! You have remaining tasks.',
              style: TextStyle(fontSize: 25, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Important Tasks:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          // List of important tasks
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                DateTime date = tasks[index].deadline ?? DateTime.now();
                String deadline = "${date.day}/${date.month}/${date.year}";
                return TaskTile(
                  task_progress: tasks[index].progress,
                  task_deadline: deadline,
                  task_title: tasks[index].title,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
