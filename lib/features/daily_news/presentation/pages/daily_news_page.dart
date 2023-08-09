import 'package:flutter/material.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily News",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}