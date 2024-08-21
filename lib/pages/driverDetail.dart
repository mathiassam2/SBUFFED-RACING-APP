import 'package:flutter/material.dart';

class DriverDetail extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String pos;
  final String pts;
  final String driverImagePath;
  final String teamColor;
  final String teamImagePath;
  final String driverNumber;

  const DriverDetail({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.pos,
    required this.pts,
    required this.driverImagePath,
    required this.teamColor,
    required this.teamImagePath,
    required this.driverNumber,
  });

  @override
  Widget build(BuildContext context) {
    final Color customColor = _hexToColor(teamColor);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '$firstName $lastName',
            style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDriverImage(),
            const SizedBox(height: 16.0),
            _buildDriverInfo(customColor),
            const SizedBox(height: 16.0),
            _buildTeamLogo(),
            // Add more details as needed
          ],
        ),
      ),
    );
  }

  Widget _buildDriverImage() {
    return Center(
      child: Image.asset(
        driverImagePath,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDriverInfo(Color customColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'First Name: $firstName',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          'Last Name: $lastName',
          style: TextStyle(color: customColor, fontSize: 18),
        ),
        Text(
          'Position: $pos',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          'Points: $pts',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildTeamLogo() {
    return Center(
      child: Image.asset(
        teamImagePath,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  Color _hexToColor(String teamColor) {
    teamColor = teamColor.replaceAll("#", "");
    return Color(int.parse("FF$teamColor", radix: 16));
  }
}
