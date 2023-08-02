import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/screens/add_dream.dart';
import 'package:dream_diary/utils.dart';
import 'package:flutter/material.dart';

class DreamDetailsScreen extends StatelessWidget {
  const DreamDetailsScreen({super.key, required this.dream});

  final Dream dream;

  void _editDream(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddDreamScreen(selectedDate: dream.date, oldDream: dream),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kBackgroundGradient),
      child: Scaffold(
        appBar: AppBar(
          title: Text(dream.title),
          actions: [
            IconButton(
              onPressed: () {
                _editDream(context);
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date
                Text(
                  dream.formattedDate,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
          
                // Dream type
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dream.dreamType.color,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      dream.dreamType.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
          
                // Description
                const Divider(),
                const SizedBox(height: 10),
                Text(dream.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
