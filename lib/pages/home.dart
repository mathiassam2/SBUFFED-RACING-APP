import 'package:flutter/material.dart';

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
        children: const [
          // First Card
          Card(
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
          // Upcoming Race Text with increased top margin
          Padding(
            padding:
                EdgeInsets.only(top: 24.0, bottom: 8.0), // Increased top margin
            child: Text(
              'Upcoming Race',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
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
          // Standings Text with increased top margin
          Padding(
            padding:
                EdgeInsets.only(top: 24.0, bottom: 8.0), // Increased top margin
            child: Text(
              'Standings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
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
