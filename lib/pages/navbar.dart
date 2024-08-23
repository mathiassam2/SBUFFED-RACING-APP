import 'package:flutter/material.dart';
import 'home.dart';
import 'events.dart';
import 'championship.dart';
import 'profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const HomePage(),
    const EventsPage(),
    const ChampionshipPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: Stack(
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
                _buildBottomNavigationBarItem(
                    Icons.calendar_today, 'Events', 1),
                _buildBottomNavigationBarItem(
                    Icons.emoji_events, 'Championship', 2),
                _buildBottomNavigationBarItem(Icons.person, 'Profile', 3),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              top: 0,
              left: (_selectedIndex / 4) * MediaQuery.of(context).size.width,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 3.0,
                color: const Color(0xFFF7DA1B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.white54,
      ),
      label: label,
    );
  }
}
