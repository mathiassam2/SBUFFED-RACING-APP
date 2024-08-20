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
            driverImagePath: 'assets/images/drivers/julian_nelson.png',
            teamColor: '#F7DA1B',
            teamImagePath: 'assets/images/constructors/renault.png',
          ),
          SizedBox(height: 8.0),
          DriverCard(
            firstName: 'Isaac',
            lastName: 'Anderson',
            pos: '02',
            pts: '38',
            driverImagePath: 'assets/images/drivers/isaac_anderson.png',
            teamColor: '#08B1A0',
            teamImagePath: 'assets/images/constructors/mercedes.png',
          ),
          SizedBox(height: 8.0),
          DriverCard(
            firstName: 'Matrix',
            lastName: 'Saul',
            pos: '03',
            pts: '36',
            driverImagePath: 'assets/images/drivers/matrix_saul.png',
            teamColor: '#FE762A',
            teamImagePath: 'assets/images/constructors/mclaren.png',
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
  final String driverImagePath;
  final String teamColor;
  final String teamImagePath; // New parameter for team logo

  const DriverCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.pos,
    required this.pts,
    required this.driverImagePath,
    required this.teamColor,
    required this.teamImagePath, // Initialize the team logo
  });

  @override
  Widget build(BuildContext context) {
    // Convert teamColor string to Color
    final Color customColor = _hexToColor(teamColor);

    return Card(
      color: const Color(0xFF0D0D0D),
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
            // Driver image (in the background, should be below name and team logo)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 210, // Width of the image
                height: 210, // Height of the image
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent, // Transparent border color
                    width: 0, // Width of the border
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    driverImagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            // Name and team logo (in the foreground, should be above gradient and driver image)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 14.0, right: 16.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Team logo image with red border and top margin
                  Container(
                    margin: const EdgeInsets.only(top: 5.0), // Top margin
                    width: 50, // Adjust width as needed
                    height: 50, // Adjust height as needed
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0), // Adjust radius to match image
                      child: Image.asset(
                        teamImagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        lastName,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: customColor, // Use custom color for last name
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Positioning the position and points info (in the foreground, should be above other elements)
            Positioned(
              left: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to convert hex color string to Color
  Color _hexToColor(String teamColor) {
    teamColor = teamColor.replaceAll("#", "");
    return Color(int.parse("FF$teamColor", radix: 16));
  }
}









