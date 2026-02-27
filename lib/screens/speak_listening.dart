import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

// Placeholder for the next screen (3D Avatar Screen)
// You will replace this with your actual class later
import 'avatar_result.dart';

class SpeakListeningScreen extends StatefulWidget {
  static const String routeName = '/speak_listening';

  const SpeakListeningScreen({super.key});

  @override
  State<SpeakListeningScreen> createState() => _SpeakListeningScreenState();
}

class _SpeakListeningScreenState extends State<SpeakListeningScreen> with TickerProviderStateMixin {
  // Simulation text
  final String _recognizedText = "Good morning...";
  
  // Timer to simulate listening duration
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    
    // Simulating the listening process. 
    // After 3 seconds, it will navigate to the next screen.
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      _navigateToAvatarScreen();
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  void _navigateToAvatarScreen() {
    // Navigate to the next screen (The 3D Avatar screen you will provide next)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AvatarResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E), // Dark background
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Audio Waveform Animation
            const SizedBox(
              height: 60,
              child: AudioWaveform(),
            ),
            
            const SizedBox(height: 20),

            // 2. Red Mic Button (Active State)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE53935), // Vibrant Red
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE53935).withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.mic,
                color: Colors.white,
                size: 32,
              ),
            ),

            const SizedBox(height: 20),

            // 3. Status Text
            const Text(
              'Listening...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            // 4. Live Transcript
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 18),
                children: [
                  const TextSpan(
                    text: 'You said: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: '"$_recognizedText"',
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Widget to create the Green Waveform Animation ---
class AudioWaveform extends StatefulWidget {
  const AudioWaveform({super.key});

  @override
  State<AudioWaveform> createState() => _AudioWaveformState();
}

class _AudioWaveformState extends State<AudioWaveform> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(15, (index) {
        // Calculate a random looking wave pattern based on index
        // We use the controller value to animate the height
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Generate a wave height based on Sine wave + Randomness
            double progress = _controller.value;
            double offset = index * 0.5; 
            double waveHeight = 10 + 25 * (sin((progress * 2 * pi) + offset).abs());
            
            // Make middle bars taller
            if (index > 4 && index < 10) {
              waveHeight += 15;
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 4,
              height: waveHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF00FF88), // Bright Green
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        );
      }),
    );
  }
}