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
            imagePath: 'assets/images/julian_nelson.png', // Path to image
          ),
          SizedBox(height: 8.0), // Add space between cards
          CustomCard(
            firstName: 'Max',
            lastName: 'Verstappen',
            pos: '02',
            pts: '38',
            imagePath: 'assets/images/isaac_anderson.png', // Path to image
          ),
          SizedBox(height: 8.0), // Add space between cards
          CustomCard(
            firstName: 'Lewis',
            lastName: 'Hamilton',
            pos: '03',
            pts: '36',
            imagePath: 'assets/images/matrix_saul.png', // Path to image
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
      iconTheme: const IconThemeData(
        color: Colors.white, // Set back button color to white
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String pos;
  final String pts;
  final String imagePath;

  const CustomCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.pos,
    required this.pts,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 29, 29, 29),
      child: SizedBox(
        height: 245.0,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 14.0, right: 16.0, bottom: 5.0),
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
                  const Spacer(),
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
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25.0),
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
                              fontSize: 36,
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
            Positioned(
              right: -190,
              bottom: -320,
              child: Container(
                width: 550, // Width of the image
                height: 550, // Height of the image
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Red border color
                    width: 2, // Width of the border
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




