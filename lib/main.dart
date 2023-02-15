import 'package:app/di.dart';
import 'package:flutter/material.dart';

import 'ui/home/screen.dart';

void main() {
  setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadence',
      theme: ThemeData.dark().copyWith(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .4))),
      home: const HomeScreen(),
    );
  }
}
