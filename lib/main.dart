import 'package:flutter/material.dart';
import 'package:person_tile/home_view.dart';

void main() {
  runApp(const PersonsApp());
}

class PersonsApp extends StatelessWidget {
  const PersonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persons List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
