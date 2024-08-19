import 'package:flutter/material.dart';

class ChampionshipPage extends StatelessWidget {
  const ChampionshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Championship',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back button color to white
        ),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Championship Content',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
