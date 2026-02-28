import 'package:flutter/material.dart';

class SignToSpeakScreen extends StatefulWidget {
  static const String routeName = '/sign_to_speak';

  const SignToSpeakScreen({super.key});

  @override
  State<SignToSpeakScreen> createState() => _SignToSpeakScreenState();
}

class _SignToSpeakScreenState extends State<SignToSpeakScreen> {
  // --- Dynamic State Variables for ML Integration ---
  
  // 1. Detection State: Controls camera active/inactive UI
  bool _isDetecting = false;
  
  // 2. Auto Mode: Toggle for continuous translation
  bool _isAutoMode = false;
  
  // 3. Confidence Level: Dynamic value (0.0 to 1.0) from ML Model
  double _confidence = 0.0;
  
  // 4. History Log: List of translated phrases
  final List<String> _historyLog = [];
  
  // 5. Status Text: Updates based on model state
  String _statusTitle = "Waiting for sign input...";
  String _statusSubtitle = "Start detection to translate";

  // --- Mock ML Data Simulation (Remove this in production) ---
  void _simulateMLDetection() {
    if (!_isDetecting) return;

    // This simulates receiving data from your ML Model
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted || !_isDetecting) return;
      setState(() {
        _confidence = 0.85; // Mock confidence
        String newTranslation = "Hello World";
        _historyLog.insert(0, newTranslation); // Add to top of list
        _statusTitle = "Translating...";
        _statusSubtitle = "Detected: $newTranslation";
      });
      // Loop simulation
      _simulateMLDetection(); 
    });
  }

  void _toggleDetection() {
    setState(() {
      _isDetecting = !_isDetecting;
      if (_isDetecting) {
        _statusTitle = "Camera Active";
        _statusSubtitle = "Scanning for hand gestures...";
        _simulateMLDetection(); // Start receiving data
      } else {
        _confidence = 0.0;
        _statusTitle = "Waiting for sign input...";
        _statusSubtitle = "Start detection to translate";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Custom Colors extracted from your design
    final Color kPrimaryDark = const Color(0xFF100A1C); // Very dark purple background
    final Color kPanelColor = const Color(0xFF1A1225); // Slightly lighter panel
    final Color kAccentPurple = const Color(0xFF9C27B0); // Bright Purple
    final Color kTextWhite = Colors.white;

    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: AppBar(
        backgroundColor: kPrimaryDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'Sign ', style: TextStyle(color: kTextWhite)),
              TextSpan(text: '→ ', style: TextStyle(color: Colors.grey[600])),
              TextSpan(text: 'Speak', style: TextStyle(color: kAccentPurple)),
            ],
          ),
        ),
        actions: [
          // Auto Toggle Button
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FilterChip(
              label: const Text('Auto'),
              selected: _isAutoMode,
              onSelected: (bool value) {
                setState(() {
                  _isAutoMode = value;
                });
              },
              backgroundColor: const Color(0xFF2A1F3D),
              selectedColor: kAccentPurple.withValues(alpha: 0.2),
              checkmarkColor: kAccentPurple,
              labelStyle: TextStyle(
                color: _isAutoMode ? kAccentPurple : Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: _isAutoMode ? kAccentPurple : Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // --- 1. Confidence Bar (Dynamic) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recognition Confidence',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                    Text('${(_confidence * 100).toInt()}%',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: _confidence,
                  backgroundColor: const Color(0xFF2A1F3D),
                  valueColor: AlwaysStoppedAnimation<Color>(kAccentPurple),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            ),
          ),

          // --- 2. Main Camera Area (Stack) ---
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: kPanelColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // A. Camera Feed Layer
                    // TODO: Replace 'Container' below with CameraPreview(controller)
                    if (_isDetecting)
                      Container(color: Colors.black) // Placeholder for Camera
                    else
                      Container(color: kPanelColor),

                    // B. History Panel Overlay (Left Side)
                    Positioned(
                      left: 10,
                      top: 10,
                      bottom: 10,
                      width: 160,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: kPrimaryDark.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 6, height: 6,
                                  decoration: BoxDecoration(
                                    color: kAccentPurple, shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 8),
                                const Text('History', 
                                  style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              // Dynamic List of History Items
                              child: _historyLog.isEmpty
                                  ? Center(
                                      child: Text(
                                        "No translations yet",
                                        style: TextStyle(
                                            color: Colors.grey[600], fontSize: 11),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: _historyLog.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            _historyLog[index],
                                            style: TextStyle(
                                                color: Colors.grey[300], fontSize: 13),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // C. Center Prompt (Visible when NOT detecting)
                    if (!_isDetecting)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    color: kAccentPurple.withValues(alpha: 0.5), width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: kAccentPurple.withValues(alpha: 0.1),
                                    blurRadius: 30,
                                    spreadRadius: 10,
                                  )
                                ],
                              ),
                              child: Icon(Icons.camera_alt_outlined, 
                                size: 40, color: kAccentPurple),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Tap to start detection",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),

                    // D. Start Button (Bottom Right)
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: GestureDetector(
                        onTap: _toggleDetection,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A1F3D),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: kAccentPurple.withValues(alpha: 0.5)),
                 

                          ),
                          child: Row(
                            children: [
                              Icon(
                                _isDetecting ? Icons.stop : Icons.camera_alt_outlined,
                                color: kAccentPurple, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                _isDetecting ? 'Stop' : 'Start',
                                style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // --- 3. Bottom Status Panel (Dynamic) ---
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPanelColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Row(
              children: [
                // Icon Box (Speaker)
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A1F3D),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.volume_up,
                    color: kAccentPurple.withValues(alpha: 0.7),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                
                // Dynamic Status Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _statusTitle, // Dynamic Variable
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _statusSubtitle, // Dynamic Variable
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}