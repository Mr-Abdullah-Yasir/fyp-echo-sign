import 'package:flutter/material.dart';

class SpeakToSignScreen extends StatefulWidget {
  static const String routeName = '/speak_to_sign';

  const SpeakToSignScreen({super.key});

  @override
  State<SpeakToSignScreen> createState() => _SpeakToSignScreenState();
}

class _SpeakToSignScreenState extends State<SpeakToSignScreen> {
  bool _isListening = false;

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
            // Microphone Button with Ripple/Glow Effect
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _isListening = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _isListening = false;
                });
                // Add navigation or logic here after speech is captured
                Navigator.pushNamed(context, '/speak_listening');
              },
              onTapCancel: () {
                setState(() {
                  _isListening = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _isListening ? 110 : 100,
                height: _isListening ? 110 : 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE53935), // Vibrant Red
                  boxShadow: [
                    // Glow effect
                    BoxShadow(
                      color: const Color(0xFFE53935).withValues(alpha: 0.5),
                      blurRadius: _isListening ? 40 : 20,
                      spreadRadius: _isListening ? 10 : 2,
                    ),
                  ],
                ),
                child: const Icon(
              
                  Icons.mic,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Instruction Text
            Text(
              _isListening ? 'Listening...' : 'Hold to speak...',
          
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}