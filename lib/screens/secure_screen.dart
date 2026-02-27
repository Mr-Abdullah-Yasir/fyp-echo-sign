import 'package:flutter/material.dart';
import 'skip_continue_screen.dart';

class SecureScreen extends StatelessWidget {
  static const routeName = '/secure';
  const SecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // Background with subtle purple glow
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
                  // Features row with icons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeatureItem(
                        icon: Icons.signal_wifi_off,
                        iconColor: Colors.red,
                        label: "No internet\nneeded",
                      ),
                      FeatureItem(
                        icon: Icons.battery_0_bar,
                        iconColor: Color(0xFFAB47BC),
                        label: "Low power\nusage",
                      ),
                      FeatureItem(
                        icon: Icons.lock,
                        iconColor: Color(0xFFAB47BC),
                        label: "100% Private",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Main title with glow
                  const Text(
                    'Works Offline &\nAnywhere',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFAB47BC),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Color(0xFFAB47BC),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Subtitle
                  const Text(
                    'Runs on low-end phones.\nYour data stays private – never leaves your device.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Swipe to continue
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, SkipContinueScreen.routeName),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Swipe to continue',
                    style: TextStyle(color: Colors.white54),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white54,
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

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: iconColor.withValues(alpha: 0.3), width: 1),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
