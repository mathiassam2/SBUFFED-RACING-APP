import 'package:flutter/material.dart';

class MerchandisePage extends StatelessWidget {
  const MerchandisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SBUFFED Merchandise'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Merchandise Items Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
