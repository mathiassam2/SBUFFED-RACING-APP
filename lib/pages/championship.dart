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
          DriverCard(
            firstName: 'Julian',
            lastName: 'Nelson',
            pos: '01',
            pts: '40',
            imagePath: 'assets/images/julian_nelson.png',
            hexColor: '#F7DA1B',
          ),
          SizedBox(height: 8.0),
          DriverCard(
            firstName: 'Isaac',
            lastName: 'Anderson',
            pos: '02',
            pts: '38',
            imagePath: 'assets/images/isaac_anderson.png',
            hexColor: '#08B1A0',
          ),
          SizedBox(height: 8.0),
          DriverCard(
            firstName: 'Matrix',
            lastName: 'Saul',
            pos: '03',
            pts: '36',
            imagePath: 'assets/images/matrix_saul.png',
            hexColor: '#FE762A',
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

class DriverCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String pos;
  final String pts;
  final String imagePath;
  final String hexColor;

  const DriverCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.pos,
    required this.pts,
    required this.imagePath,
    required this.hexColor, // New hex color parameter
  });

  @override
  Widget build(BuildContext context) {
    // Convert hexColor string to Color
    final Color customColor = _hexToColor(hexColor);

    return Card(
      color: const Color.fromARGB(255, 29, 29, 29),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Same border radius as Card
      ),
      child: SizedBox(
        height: 245.0,
        child: Stack(
          children: [
            // Radial Gradient Positioned at the top-right corner with rounded border
            Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                child: Container(
                  width: 400, // Adjust the width of the gradient
                  height: 400, // Adjust the height of the gradient
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        customColor.withOpacity(0.1), // Gradient start color
                        Colors.transparent,           // Gradient end color
                      ],
                      radius: 0.85, // Radius of the gradient
                      center: const Alignment(1.0, -1.0), // Centered at the top-right corner
                      focal: const Alignment(1.0, -1.0),
                      focalRadius: 0.1, // Focal point radius, adjust for focus effect
                    ),
                  ),
                ),
              ),
            ),
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
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: customColor, // Use custom color for last name
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
              right: 0,
              bottom: 0,
              child: Container(
                width: 220, // Width of the image
                height: 220, // Height of the image
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Transparent border color
                    width: 0, // Width of the border
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

  // Helper method to convert hex color string to Color
  Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("FF$hexColor", radix: 16));
  }
}






