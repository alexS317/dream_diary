import 'package:dream_diary/models/dream.dart';
import 'package:flutter/material.dart';

class DreamListItem extends StatelessWidget {
  const DreamListItem({super.key, required this.dream});

  final Dream dream;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dream.dreamType.color,
          ),
        ),
        title: Text(dream.title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
