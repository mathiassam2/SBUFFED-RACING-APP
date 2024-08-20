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
            driverNumber: '1  ',
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
            driverNumber: '69',
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
            driverNumber: '7  ',
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
        color: Colors.white,
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
  final String teamImagePath;
  final String driverNumber;

  const DriverCard({
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

    return Card(
      color: const Color(0xFF0D0D0D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 245.0,
        child: Stack(
          children: [
            _buildGradientBackground(customColor),
            _buildDriverNumber(),
            _buildDriverImage(),
            _buildDriverInfo(customColor),
            _buildPositionAndPoints(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBackground(Color customColor) {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [customColor.withOpacity(0.05), Colors.transparent],
              radius: 0.85,
              center: const Alignment(1.0, -1.0),
              focal: const Alignment(1.0, -1.0),
              focalRadius: 0.1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDriverNumber() {
    final Color teamColorFill = _hexToColor(teamColor).withOpacity(0.1);

    return Positioned(
      bottom: -35,
      right: -10,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            driverNumber,
            style: TextStyle(
              fontSize: 205,
              fontWeight: FontWeight.w800,
              color: teamColorFill.withOpacity(0.1),
              height: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDriverImage() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 210,
        height: 210,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0),
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
    );
  }

  Widget _buildDriverInfo(Color customColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTeamLogo(),
          const SizedBox(width: 16.0),
          _buildDriverName(customColor),
        ],
      ),
    );
  }

  Widget _buildTeamLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          teamImagePath,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildDriverName(Color customColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstName,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          lastName,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: customColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPositionAndPoints() {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 6.0),
        child: Row(
          children: [
            _buildInfoColumn('Pos', pos),
            const SizedBox(width: 25.0),
            _buildInfoColumn('Pts', pts),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Color _hexToColor(String teamColor) {
    teamColor = teamColor.replaceAll("#", "");
    return Color(int.parse("FF$teamColor", radix: 16));
  }
}