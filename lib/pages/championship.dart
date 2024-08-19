import 'package:flutter/material.dart';

class ChampionshipPage extends StatelessWidget {
  const ChampionshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          CustomCard(
            firstName: 'Mathias',
            lastName: 'Sam',
            pos: '01',
            pts: '40',
          ),
          CustomCard(
            firstName: 'Max',
            lastName: 'Verstappen',
            pos: '02',
            pts: '38',
          ),
          CustomCard(
            firstName: 'Lewis',
            lastName: 'Hamilton',
            pos: '03',
            pts: '36',
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Championship',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
    );
  }
}

class CustomCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String pos;
  final String pts;

  const CustomCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.pos,
    required this.pts,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 29, 29, 29),
      child: SizedBox(
        height: 245.0, // Set the height of the card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              Text(
                lastName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(), // Pushes content to the top and bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pos',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        pos,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 25.0), // Tab space equivalent
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pts',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        pts,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


