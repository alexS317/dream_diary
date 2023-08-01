import 'package:dream_diary/models/dream.dart';
import 'package:flutter/material.dart';

const dreamTypes = {
  DreamTypes.lucid: DreamType(
    'lucid',
    Color.fromARGB(255, 11, 136, 171),
    // Color.fromARGB(255, 23, 136, 189),
  ),
  DreamTypes.halfLucid: DreamType(
    'half-lucid',
    Color.fromARGB(255, 108, 215, 245),
  ),
  DreamTypes.nonLucid: DreamType(
    'non-lucid',
    Color.fromARGB(255, 212, 246, 255),
  ),
};
