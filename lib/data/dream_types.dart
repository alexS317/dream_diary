import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/utils.dart';

final dreamTypes = {
  DreamTypes.lucid: DreamType(
    'lucid',
    kSecondaryColors[0],
  ),
  DreamTypes.halfLucid: DreamType(
    'half-lucid',
    kSecondaryColors[1],
  ),
  DreamTypes.nonLucid: DreamType(
    'non-lucid',
    kSecondaryColors[2],
  ),
};
