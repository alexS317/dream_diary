import 'package:dream_diary/data/dummy_dreams.dart';
import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/screens/add_dream.dart';
import 'package:dream_diary/utils.dart';
import 'package:dream_diary/widgets/dreams_list.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Only get dreams that have the exact same date as the selected day
  List<Dream> _getDreamsForDay(DateTime day) {
    return dummyDreams
        .where((element) =>
            element.date.day == day.day &&
            element.date.month == day.month &&
            element.date.year == day.year)
        .toList();
  }

  void _addDream() async {
    final newDream = await Navigator.of(context).push<Dream>(
      MaterialPageRoute(
        builder: (context) => AddDreamScreen(selectedDate: _selectedDay!),
      ),
    );

    if (newDream == null) return;

    setState(() {
      dummyDreams.add(newDream);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    var calendarStyle = CalendarStyle(
      markerDecoration: BoxDecoration(
        color: kSecondaryColors[1],
        shape: BoxShape.circle,
      ),
      weekendTextStyle: TextStyle(color: kSecondaryColors[1]),
    );

    var daysStyle = DaysOfWeekStyle(
      weekdayStyle: TextStyle(color: kSecondaryColors[1]),
      weekendStyle: TextStyle(color: kSecondaryColors[0]),
    );

    return Container(
      decoration: const BoxDecoration(gradient: kBackgroundGradient),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dream Diary'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Calendar view
              TableCalendar(
                daysOfWeekStyle: daysStyle,
                calendarStyle: calendarStyle,
                focusedDay: _focusedDay,
                firstDay: DateTime(DateTime.now().year - 10),
                lastDay: DateTime.now(),
                availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                startingDayOfWeek: StartingDayOfWeek.monday,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                eventLoader: (day) => _getDreamsForDay(day),
              ),
              const SizedBox(height: 20),

              // Add button
              ElevatedButton.icon(
                onPressed: _addDream,
                icon: const Icon(Icons.add),
                label: const Text('Add dream'),
              ),
              const SizedBox(height: 10),

              // Display dreams for selected day
              DreamsList(
                dreams: _getDreamsForDay(_selectedDay!),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
