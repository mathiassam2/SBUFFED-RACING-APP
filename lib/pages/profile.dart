import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void logoutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: logoutUser,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Profile Page: ${user.email!}",
          style: const TextStyle(
              color: Colors.white
          )
        ),
      ),
    );
  }
}
