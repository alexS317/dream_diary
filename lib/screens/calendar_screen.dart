import 'package:dream_diary/widgets/calendar.dart';
import 'package:dream_diary/widgets/dreams_list.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Diary'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Column(
        children: [
          Calendar(),
          SizedBox(height: 20),
          DreamsList(),
        ],
      ),
    );
  }
}
