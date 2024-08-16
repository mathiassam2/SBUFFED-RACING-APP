import 'package:first_app/pages/main_page.dart';
// import 'package:first_app/pages/events.dart';
// import 'package:first_app/pages/championship.dart';
// import 'package:first_app/pages/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
