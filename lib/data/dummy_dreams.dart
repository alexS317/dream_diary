import 'package:dream_diary/data/dream_types.dart';
import 'package:dream_diary/models/dream.dart';

var dummyDreams = [
  Dream(
    title: 'Dream 1',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.lucid]!,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Dream(
    title: 'Dream 2',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.partlyLucid]!,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Dream(
    title: 'Dream 3',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.notLucid]!,
  ),
    Dream(
    title: 'Dream 4',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.lucid]!,
  ),
    Dream(
    title: 'Dream 5',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.partlyLucid]!,
  ),
    Dream(
    title: 'Dream 6',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.notLucid]!,
  ),
  Dream(
    title: 'Dream 7',
    description: 'This is a dream',
    dreamType: dreamTypes[DreamTypes.notLucid]!,
  ),
];
