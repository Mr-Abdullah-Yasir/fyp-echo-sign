import 'package:flutter/material.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const routeName = '/get-started';
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // Background with subtle purple gradient and glow
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 0.8,
                colors: [
                  Color(0xFF121212),
                  Color(0xFF2A1B3D),
                ],
              ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Camera and Mic icons with glow
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PermissionIcon(icon: Icons.camera_alt),
                      SizedBox(width: 40),
                      PermissionIcon(icon: Icons.mic),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Title with glow
                  const Text(
                    'Start Translating',
                    style: TextStyle(
                      color: Color(0xFFAB47BC),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Color(0xFFAB47BC),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  const Text(
                    'Allow camera and mic access?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Get Started button
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAB47BC),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PermissionIcon extends StatelessWidget {
  final IconData icon;

  const PermissionIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFAB47BC).withValues(alpha: 0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFAB47BC).withValues(alpha: 0.4),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: const Color(0xFFAB47BC),
        size: 36,
      ),
    );
  }
}
