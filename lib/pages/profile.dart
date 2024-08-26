import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void logoutUser(BuildContext context) async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google account
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
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
            onPressed: () => logoutUser(context),
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
