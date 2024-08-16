import 'package:flutter/material.dart';
import 'events.dart'; // Import the Events page
import 'championship.dart'; // Import the Championship page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // First Card
          const Card(
            color: Color.fromARGB(255, 29, 29, 29),
            child: SizedBox(
              height: 245.0,
              child: ListTile(
                title: Text(
                  'Card Title 1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
          // Upcoming Race Row
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming Race',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventsPage()),
                    );
                  },
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
          ),
          const Card(
            color: Color.fromARGB(255, 29, 29, 29),
            child: SizedBox(
              height: 245.0,
              child: ListTile(
                title: Text(
                  'Card Title 2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
          // Standings Row
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Standings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChampionshipPage()),
                    );
                  },
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
          ),
          const Card(
            color: Color.fromARGB(255, 29, 29, 29),
            child: SizedBox(
              height: 245.0,
              child: ListTile(
                title: Text(
                  'Card Title 3',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
