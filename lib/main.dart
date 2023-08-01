import 'package:dream_diary/screens/calendar.dart';
import 'package:dream_diary/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Diary',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        listTileTheme: const ListTileThemeData().copyWith(
          tileColor: kColorScheme.primary,
          titleTextStyle: const TextStyle().copyWith(
            color: kColorScheme.onPrimary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kSecondaryColorScheme.primary,
            foregroundColor: kSecondaryColorScheme.onPrimary,
          ),
        ),
      ),
      home: const CalendarScreen(),
    );
  }
}
