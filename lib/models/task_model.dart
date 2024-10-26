import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String title;
  DateTime? deadline;
  double progress;
  double? workload;
  Difficulty difficulty;
  Timestamp? createdOn;

  TaskModel(
      {required this.title,
      this.deadline,
      required this.progress,
      this.workload,
      required this.difficulty,
      this.createdOn});

  // Method to convert JSON object to Task object
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        title: json['title'],
        deadline: json['deadline'],
        progress: json['progress'],
        workload: json['workload'],
        difficulty: json['difficulty'],
        createdOn: json['createdOn']);
  }

  // Method to convert TaskModel object to JSON object
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['deadline'] = deadline;
    data['progress'] = progress;
    data['workload'] = workload;
    data['difficulty'] = difficulty;
    data['createdOn'] = createdOn;
    return data;
  }
}

enum Difficulty {
  easy,
  medium,
  hard,
}
