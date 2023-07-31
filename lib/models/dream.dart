enum DreamType { lucid, halfLucid, nonLucid }

class Dream {
  Dream({
    this.title,
    required this.description,
    required this.dreamType,
    String? date,
  }) : date = date ?? DateTime.now().toIso8601String();
  // ^ Set current date as date, if there isn't a date yet

  final String? title;
  final String description;
  final DreamType dreamType;
  final String date;
}
