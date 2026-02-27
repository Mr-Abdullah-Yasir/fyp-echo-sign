import 'package:flutter/material.dart';

class GlossScreen extends StatefulWidget {
  static const String routeName = '/gloss_screen';

  const GlossScreen({super.key});

  @override
  State<GlossScreen> createState() => _GlossScreenState();
}

class _GlossScreenState extends State<GlossScreen> {
  // Shared Design System
  static const Color bgColor = Color(0xFF0D0B14);
  static const Color cardColor = Color(0xFF16121E);
  static const Color accentPurple = Color(0xFF9D59FF);
  static const Color darkButtonColor = Color(0xFF1D1925);

  final String _englishInput = 'how are you';
  final String _aslGloss = 'HOW YOU';

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
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Stepper Header (Updated Active State)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepBadge('Type', Icons.keyboard_alt_outlined, false),
                _buildStepDivider(),
                _buildStepBadge('Gloss', Icons.text_snippet_outlined, true),
                _buildStepDivider(),
                _buildStepBadge('Sign', Icons.accessibility_new_outlined, false),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'ENGLISH INPUT',
                    style: TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                    ),
                    child: Text(
                      _englishInput,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: darkButtonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: accentPurple.withValues(alpha: 0.3)),
                      ),
                      child: const Icon(Icons.keyboard_double_arrow_down_rounded, color: accentPurple),
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'ASL GLOSS',
                    style: TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [accentPurple, accentPurple.withValues(alpha: 0.8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: accentPurple.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          _aslGloss,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                           
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'ASL Sentence Structure Applied',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: darkButtonColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'Edit Text',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/sign_animation'),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: accentPurple,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: accentPurple.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Watch Sign',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.play_circle_fill, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
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
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
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