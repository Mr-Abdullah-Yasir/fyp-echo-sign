import 'package:flutter/material.dart';

class AvatarResultScreen extends StatefulWidget {
  static const String routeName = '/avatar_result';

  const AvatarResultScreen({super.key});

  @override
  State<AvatarResultScreen> createState() => _AvatarResultScreenState();
}

class _AvatarResultScreenState extends State<AvatarResultScreen> {
  // The recognized text passed from the previous screen
  final String _recognizedText = "Good morning, how are you?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E), // Dark Navy Background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Speak → Sign',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              // Logic to replay the animation
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- 3D Avatar Container ---
            Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                // Slightly lighter/purplish dark tone for the card background
                color: const Color(0xFF232336), 
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              // ClipRRect ensures the 3D model/Image stays inside the rounded corners
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // TODO: Replace this Icon with your 3D Model Viewer
                    // Example: ModelViewer(src: 'assets/avatar.glb')
                    
                    // Placeholder visual matching your screenshot
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // Gradient to simulate the lighting in the image
                            gradient: RadialGradient(
                              colors: [Color(0xFFFFD54F), Color(0xFFFFA000)],
                              center: Alignment(-0.2, -0.2),
                            ),
                          ),
                          child: const Icon(
                            Icons.face, 
                            size: 100, 
                            color: Color(0xFF5D4037),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 40),

            // --- Recognized Text ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '"$_recognizedText"',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --- Replay Instruction ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tap ',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF448AFF), // Blue accent for icon
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.replay,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                Text(
                  ' to replay',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}