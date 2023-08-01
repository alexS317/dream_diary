import 'package:flutter/material.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 3, 9, 73));

final kSecondaryColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 108, 215, 245));

const kBackgroundGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 13, 16, 65),
    Color.fromARGB(255, 22, 27, 95),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const kSecondaryColors = [
  Color.fromARGB(255, 11, 136, 171),
  Color.fromARGB(255, 108, 215, 245),
  Color.fromARGB(255, 212, 246, 255),
];
