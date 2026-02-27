import 'dart:ui';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _selectedGender;

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
                  const SizedBox(height: 20),
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
                    "Let's get started!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFAB47BC),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Signup form with glassmorphism
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
                            // Full Name
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Full Name',
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
                            // Email or Phone
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email or Phone',
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
                            const SizedBox(height: 16),
                            // Confirm Password
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
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
                            // Gender selection
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Choose your signing avatar',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Gender radio buttons
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        value: 'male',
                                        groupValue: _selectedGender,
                                        activeColor: const Color(0xFFAB47BC),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        },
                                      ),
                                      const Text('Male', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        value: 'female',
                                        groupValue: _selectedGender,
                                        activeColor: const Color(0xFFAB47BC),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value;
                                          });
                                        },
                                      ),
                                      const Text('Female', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Sign Up Button
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
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? ", style: TextStyle(color: Colors.white70)),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Sign In',
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
