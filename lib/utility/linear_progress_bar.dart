import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({super.key, required this.progress});

  final double progress; // value between 0 to 1

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      minHeight: 10,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
