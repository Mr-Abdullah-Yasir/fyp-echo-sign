import 'package:flutter/material.dart';

class TypeToGlossScreen extends StatefulWidget {
  static const String routeName = '/text_to_gloss';

  const TypeToGlossScreen({super.key});

  @override
  State<TypeToGlossScreen> createState() => _TypeToGlossScreenState();
}

class _TypeToGlossScreenState extends State<TypeToGlossScreen> {
  // Design Colors matching the Main Screen
  static const Color bgColor = Color(0xFF0D0B14);
  static const Color cardColor = Color(0xFF16121E);
  static const Color accentPurple = Color(0xFF9D59FF);
  static const Color darkButtonColor = Color(0xFF1D1925);

  String _inputText = '';
  String _glossText = '';

  void _convertToGloss() {
    setState(() {
      _glossText = _inputText;
    });
  }

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
          // Stepper Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepBadge('Type', Icons.keyboard_alt_outlined, true),
                _buildStepDivider(),
                _buildStepBadge('Gloss', Icons.text_snippet_outlined, false),
                _buildStepDivider(),
                _buildStepBadge('Sign', Icons.accessibility_new_outlined, false),
              ],
            ),
          ),

          // Main Interactive Area
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon with Glow
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [accentPurple.withOpacity(0.2), Colors.transparent],
                      ),
                    ),
                    child: const Icon(Icons.text_fields_rounded, color: accentPurple, size: 40),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Type your message in English',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'It will be converted to ASL gloss notation',
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                  if (_glossText.isNotEmpty) ...[
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _glossText,
                        style: const TextStyle(color: accentPurple, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),

          // Bottom Input Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (v) => _inputText = v,
                    decoration: InputDecoration(
                      hintText: 'Type message...',
                      hintStyle: const TextStyle(color: Colors.white24),
                      filled: true,
                      fillColor: darkButtonColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: accentPurple, width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    _convertToGloss();
                    // Keeping your route logic
                    Navigator.pushNamed(context, '/gloss_screen');
                  },
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      children: [
                        Text(
                          'Convert',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
                      ],
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

  // Helper to build the step badges at the top
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