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
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text('Championship Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
