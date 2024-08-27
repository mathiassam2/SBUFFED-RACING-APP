import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void logoutUser(BuildContext context) async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google account
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    // Navigate back to the login screen or home page
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void showLogoutPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            color: Color(0xFF0D0D0D),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => logoutUser(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x33F21D1D), // 20% opacity fill
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(
                    color: Color(0x80F21D1D), // 50% opacity stroke
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Log out'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => showLogoutPanel(context),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: user != null
            ? Text(
          "Profile Page: ${user.email}",
          style: const TextStyle(color: Colors.white),
        )
            : const Text(
          "No user logged in",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
