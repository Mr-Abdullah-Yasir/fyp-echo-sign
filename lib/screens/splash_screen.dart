import 'package:flutter/material.dart';
import 'secure_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, SecureScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background as in screenshot
      body: Stack(
        children: [
          // Background decoration (optional: add subtle particles if needed)
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF121212),
            ),
          ),
          // Main content
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo placeholder (replace with your logo icon)
                Icon(
                  Icons.accessibility,
                  size: 100,
                  color: Color(0xFFAB47BC), // Purple as in screenshot
                ),
                SizedBox(height: 20),
                // App name
                Text(
                  'ECHO_SIGN',
                  style: TextStyle(
                    color: Color(0xFFAB47BC),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 8),
                // Tagline
                Text(
                  'American Sign Language ↔ English',
                  style: TextStyle(
                    color: Color(0xFFAB47BC),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                // Features
                Text(
                  'Offline · Real-time · For Everyone',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 40),
                // Purple line
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: Color(0xFFAB47BC),
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
