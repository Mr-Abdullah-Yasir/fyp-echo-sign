import 'dart:ui';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // Logo
                  const Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFAB47BC),
                      child: Icon(
                        Icons.accessibility,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Title
                  const Text(
                    'EchoSign Pro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFAB47BC),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  const Text(
                    'American Sign Language ↔ English',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Login form with glassmorphism
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        child: Column(
                          children: [
                            // Email or Phone
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email or Phone number',
                                labelStyle: const TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.black.withValues(alpha: 0.4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            // Password
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.black.withValues(alpha: 0.4),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                suffixIcon: const Icon(Icons.visibility, color: Colors.white70),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 24),
                            // Sign In Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pushReplacementNamed(context, MainScreen.routeName),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFAB47BC),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Forgot password
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Divider
                            const Row(
                              children: [
                                Expanded(child: Divider(color: Colors.white24)),
                               
                                Expanded(child: Divider(color: Colors.white24)),
                              ],
                            ),
                         
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("New here? ", style: TextStyle(color: Colors.white70)),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, SignupScreen.routeName),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(color: Color(0xFFAB47BC)),
                        ),
                      ),
                    ],
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
