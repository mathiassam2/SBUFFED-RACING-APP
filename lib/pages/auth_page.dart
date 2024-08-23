import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'navbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const NavBar();
          }
          // user is NOT logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}