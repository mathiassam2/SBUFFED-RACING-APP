import 'package:first_app/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _hasError = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF7DA1B)),
          ),
        );
      },
    );

    try {
      // Try sign in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        _hasError = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'wrong-password' || e.code == 'user-not-found') {
          _hasError = true;
        } else {
          _hasError = true;
        }
      });
    } finally {
      // Pop the loading circle only if the widget is still mounted
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          // Unfocus all input fields when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100.0), // Padding from top
                    _buildLogo(),
                    const SizedBox(height: 25.0), // Space between logo and texts
                    _buildWelcomeText(),
                    const SizedBox(height: 0.0), // Small space between the texts
                    _buildAccountDetailsText(),
                    const SizedBox(height: 16.0),
                    _buildGoogleSignInButton(), // Add Google sign-in button
                    _buildOrSeparator(), // Add OR separator
                    _buildEmailTextField(),
                    const SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0), // Adjust padding as needed
              child: _buildLoginButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Welcome to SBUFFED!',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Adjust color as needed
        ),
      ),
    );
  }

  Widget _buildAccountDetailsText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Enter your account details',
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFC2C2C4), // Adjust color as needed
        ),
      ),
    );
  }

  Widget _buildOrSeparator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 19.0), // Top and bottom margin
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Divider(
                color: Color(0xFF30303D),
                thickness: 2.0,
              ),
            ),
          ),
          const Text(
            'OR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Divider(
                color: Color(0xFF30303D),
                thickness: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    Future<void> handleSignIn() async {
      // Show the loading dialog
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF7DA1B)),
            ),
          );
        },
      );

      try {
        // Attempt to sign in
        await AuthService().signInWithGoogle();
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
      } finally {
        // Pop the loading dialog
        if (mounted) {
          Navigator.pop(context);
        }
      }
    }
    return ElevatedButton(
      onPressed: () {
        // Call the handleSignIn function here
        handleSignIn();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Transparent background
        side: const BorderSide(color: Color(0xFF30303D), width: 2.0), // Border color and size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        foregroundColor: Colors.white, // Text color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_logo/google_logo_white.png', // Path to your Google logo asset
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 8.0),
          const Text(
            'Continue with Google',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        'assets/images/app_logo/sbuffed_text_logo.png',
        height: 100.0,
        width: 300.0,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: emailController,
      style: const TextStyle(color: Colors.white),
      decoration: _inputDecoration('Email'),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: passwordController,
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      decoration: _inputDecoration('Password'),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFFC2C2C4)),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: _hasError
            ? const BorderSide(color: Colors.red, width: 2.0)
            : const BorderSide(color: Color(0xFF30303D), width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFF7DA1B), width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: _hasError
            ? const BorderSide(color: Colors.red, width: 2.0)
            : const BorderSide(color: Color(0xFF30303D), width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity, // Make the button 100% width
      child: ElevatedButton(
        onPressed: () async {
          // Call the login function
          loginUser();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF7DA1B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
