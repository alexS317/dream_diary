import 'package:dream_diary/data/dummy_dreams.dart';
import 'package:dream_diary/models/dream.dart';
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
            DateTime.tryParse(element.date)!.day == day.day &&
            DateTime.tryParse(element.date)!.month == day.month &&
            DateTime.tryParse(element.date)!.year == day.year)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 13, 16, 65),
          Color.fromARGB(255, 22, 27, 95),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );

    var calendarStyle = const CalendarStyle(
      markerDecoration: BoxDecoration(
        color: Color.fromARGB(255, 108, 215, 245),
        shape: BoxShape.circle,
      ),
      weekendTextStyle: TextStyle(color: Color.fromARGB(255, 108, 215, 245)),
    );

    var daysStyle = const DaysOfWeekStyle(
      weekdayStyle: TextStyle(color: Color.fromARGB(255, 108, 215, 245)),
      weekendStyle: TextStyle(color: Color.fromARGB(255, 11, 136, 171)),
    );

    return Container(
      decoration: backgroundDecoration,
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
                onPressed: () {},
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
