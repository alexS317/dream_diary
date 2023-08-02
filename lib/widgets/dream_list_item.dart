import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/screens/dream_details.dart';
import 'package:flutter/material.dart';

class DreamListItem extends StatelessWidget {
  const DreamListItem({super.key, required this.dream});

  final Dream dream;

  void _openDream(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DreamDetailsScreen(dream: dream),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: InkWell(
        onTap: () {
          _openDream(context);
        },
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
      ),
    );
  }
}
