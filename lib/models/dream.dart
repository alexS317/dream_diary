import 'package:flutter/material.dart';

enum DreamTypes { lucid, halfLucid, nonLucid }

class DreamType {
  const DreamType(this.title, this.color);

  final String title;
  final Color color;
}

class Dream {
  Dream({
    required this.title,
    required this.description,
    required this.dreamType,
    DateTime? date,
  }) : date = date ?? DateTime.now();
  // ^ Set current date as date, if there isn't a date yet

  final String title;
  final String description;
  final DreamType dreamType;
  final DateTime date;
}
