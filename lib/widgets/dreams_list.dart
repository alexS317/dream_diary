import 'package:flutter/material.dart';

class DreamsList extends StatelessWidget {
  const DreamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Card(
              child: Text('Title'),
            );
          })),
    );
  }
}
