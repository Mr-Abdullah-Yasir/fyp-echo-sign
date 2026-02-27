import 'package:flutter/material.dart';

class SignAnimationScreen extends StatefulWidget {
  static const String routeName = '/sign_animation';

  const SignAnimationScreen({super.key});

  @override
  State<SignAnimationScreen> createState() => _SignAnimationScreenState();
}

class _SignAnimationScreenState extends State<SignAnimationScreen> {
  // Shared Design System Colors
  static const Color bgColor = Color(0xFF0D0B14);
  static const Color cardColor = Color(0xFF16121E);
  static const Color accentPurple = Color(0xFF9D59FF);
  static const Color darkButtonColor = Color(0xFF1D1925);

  final String _originalText = '"how are you"';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'TYPE → GLOSS → SIGN',
          style: TextStyle(
            color: accentPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
            onPressed: () {}, // Replay logic
          ),
        ],
      ),
      body: Column(
        children: [
          // --- Top Progress Indicator ---
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepBadge('Type', Icons.keyboard_alt_outlined, false),
                _buildStepDivider(),
                _buildStepBadge('Gloss', Icons.text_snippet_outlined, false),
                _buildStepDivider(),
                _buildStepBadge('Sign', Icons.accessibility_new_outlined, true),
              ],
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Current Gloss Word Indicator ---
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    color: accentPurple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: accentPurple.withValues(alpha: 0.3)),
                  ),
                  child: const Text(
                    'HOW YOU',
                    style: TextStyle(
                      color: accentPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // --- Avatar / Animation Area ---
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer purple glow
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            accentPurple.withValues(alpha: 0.15),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    // Main Avatar Container
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cardColor,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.05),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.face_retouching_natural_rounded, // Replace with your 3D model/animation widget
                          size: 100,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // --- Karaoke Subtitles ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HOW ',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'YOU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: accentPurple, blurRadius: 15),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // --- Original Input Text ---
                Text(
                  _originalText,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.2),
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // --- Bottom Action Buttons ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    label: 'New Text',
                    icon: Icons.add_rounded,
                    isPrimary: false,
                    onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildActionButton(
                    label: 'Replay',
                    icon: Icons.replay_rounded,
                    isPrimary: true,
                    onTap: () {
                      // Trigger replay logic
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for consistent buttons
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isPrimary ? accentPurple : darkButtonColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isPrimary
              ? [BoxShadow(color: accentPurple.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepBadge(String label, IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? accentPurple : darkButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white24, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white24,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepDivider() {
    return Container(
      width: 10,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.white10,
    );
  }
}