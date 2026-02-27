import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  static const String routeName = '/practics_videos';

  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  // Shared Design System based on screenshots
  static const Color bgColor = Color(0xFF0D0B14);
  static const Color cardColor = Color(0xFF16121E);
  static const Color accentPurple = Color(0xFF9D59FF);
  static const Color darkButtonColor = Color(0xFF1D1925);

  bool isLearningMode = true; 

  final List<Map<String, String>> practiceItems = [
    {'title': 'Hello', 'category': 'Greetings'},
    {'title': 'Thank you', 'category': 'Common'},
    {'title': 'How are you?', 'category': 'Greetings'},
    {'title': 'I need help', 'category': 'Emergency'},
    {'title': 'Nice to meet you', 'category': 'Greetings'},
    {'title': 'Good morning', 'category': 'Greetings'},
    {'title': 'Goodbye', 'category': 'Greetings'},
    {'title': 'Please', 'category': 'Common'},
    {'title': 'Sorry', 'category': 'Common'},
    {'title': 'Yes', 'category': 'Common'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Practice Mode',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // --- UPDATED: Sliding Toggle Bar ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Animated Background Slider
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    alignment: isLearningMode ? Alignment.centerLeft : Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [accentPurple, Color(0xFF8231FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: accentPurple.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Tab Labels
                  Row(
                    children: [
                      Expanded(
                        child: _buildToggleTab(
                          label: "Learning",
                          icon: Icons.menu_book_rounded,
                          isActive: isLearningMode,
                          onTap: () => setState(() => isLearningMode = true),
                        ),
                      ),
                      Expanded(
                        child: _buildToggleTab(
                          label: "Testing",
                          icon: Icons.track_changes_rounded,
                          isActive: !isLearningMode,
                          onTap: () => setState(() => isLearningMode = false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // --- Search Bar ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: isLearningMode ? 'Search phrases to learn...' : 'Search phrases to test...',
                hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.2)),
                prefixIcon: Icon(Icons.search, color: Colors.white.withValues(alpha: 0.2), size: 22),
                filled: true,
                fillColor: cardColor,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // --- Content Area ---
          Expanded(
            child: isLearningMode 
              ? _buildLearningList() 
              : _buildTestingGrid(),
          ),
        ],
      ),
    );
  }

  // --- LEARNING MODE VIEW (Updated List Item Style) ---
  Widget _buildLearningList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 4, 
      itemBuilder: (context, index) {
        final item = practiceItems[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Avatar Placeholder with Purple Glow
              Container(
                height: 54, width: 54,
                decoration: BoxDecoration(
                  color: darkButtonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.person, color: Colors.amber, size: 28),
                      Icon(Icons.play_circle_fill, color: accentPurple.withValues(alpha: 0.8), size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item['category']!, style: const TextStyle(color: accentPurple, fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 24),
            ],
          ),
        );
      },
    );
  }

  // --- TESTING MODE VIEW (Updated Grid Card Style) ---
  Widget _buildTestingGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemCount: practiceItems.length,
      itemBuilder: (context, index) {
        final item = practiceItems[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['category']!, style: const TextStyle(color: accentPurple, fontSize: 12, fontWeight: FontWeight.w500)),
                  const Icon(Icons.track_changes_rounded, color: Colors.white24, size: 18),
                ],
              ),
              Text(
                item['title']!,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Helper for the Toggle Tab Labels ---
  Widget _buildToggleTab({required String label, required IconData icon, required bool isActive, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.white38, size: 20),
            const SizedBox(width: 10),
            Text(
              label, 
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white38, 
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )
            ),
          ],
        ),
      ),
    );
  }
}