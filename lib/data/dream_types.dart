import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/utils.dart';

final dreamTypes = {
  DreamTypes.lucid: DreamType(
    'lucid',
    kSecondaryColors[0],
  ),
  DreamTypes.partlyLucid: DreamType(
    'partly lucid',
    kSecondaryColors[1],
  ),
  DreamTypes.notLucid: DreamType(
    'not lucid',
    kSecondaryColors[2],
  ),
};
