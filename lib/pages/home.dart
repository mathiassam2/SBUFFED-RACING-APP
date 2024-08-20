import 'package:flutter/material.dart';
import 'events.dart'; // Import the Events page
import 'championship.dart'; // Import the Championship page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const CustomCard(
            title: 'Card Title 1',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
          ),
          SectionRow(
            title: 'Upcoming Race',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventsPage()),
            ),
          ),
          const CustomCard(
            title: 'Card Title 2',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
          ),
          SectionRow(
            title: 'Standings',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChampionshipPage()),
            ),
          ),
          const CustomCard(
            title: 'Card Title 3',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent, // Border color
            width: 0.0,        // Border width
          ),
        ),
        child: Image.asset(
          'assets/images/app_logo/sbuffed_logo.png',
          width: 100, // Adjust width as needed
          height: 40, // Adjust height as needed
          fit: BoxFit.contain, // Adjust fit as needed
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
  final String title;
  final String description;

  const CustomCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 29, 29, 29),
      child: SizedBox(
        height: 245.0,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}

class SectionRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionRow({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              'See more',
              style: TextStyle(
                  color: Color(0xFFBFAF00), // Slightly dark yellow
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
