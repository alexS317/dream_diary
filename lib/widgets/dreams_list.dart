import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/widgets/dream_list_item.dart';
import 'package:flutter/material.dart';

class DreamsList extends StatelessWidget {
  const DreamsList({
    super.key,
    required this.dreams,
  });

  final List<Dream> dreams;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No dreams saved for this day.'),
    );

    if (dreams.isNotEmpty) {
      content = ListView.builder(
        itemCount: dreams.length,
        itemBuilder: ((context, index) {
          return DreamListItem(dream: dreams[index]);
        }),
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
      );
    }

    return content;
  }
}
