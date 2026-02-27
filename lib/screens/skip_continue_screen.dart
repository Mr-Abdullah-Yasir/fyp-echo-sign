import 'package:flutter/material.dart';
import 'get_started_screen.dart';

class SkipContinueScreen extends StatelessWidget {
  static const routeName = '/skip-continue';
  const SkipContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // Dark background with subtle glow
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 0.8,
                colors: [Color(0xFF121212), Color(0xFF2A1B3D)],
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo box with hand and sparkle icons
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFAB47BC).withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.accessibility,
                          color: Color(0xFFAB47BC),
                          size: 60,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDD2A7B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                // Title
                const Text(
                  'Real-Time Translation',
                  style: TextStyle(
                    color: Color(0xFFAB47BC),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle
                const Text(
                  'Sign to Speak · Speak to Sign',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          // Swipe to continue button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: TextButton.icon(
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                GetStartedScreen.routeName,
              ),
              icon: const Icon(Icons.arrow_forward, color: Colors.white54),
              label: const Text(
                'Swipe to continue',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
