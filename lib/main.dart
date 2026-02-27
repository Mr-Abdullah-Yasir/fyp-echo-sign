import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/secure_screen.dart';
import 'screens/skip_continue_screen.dart';
import 'screens/get_started_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/main_screen.dart';
import 'screens/text_to_gloss.dart';
import 'screens/gloss_screen.dart';
import 'screens/sign_animation.dart';
import 'screens/speak_to_sign.dart';
import 'screens/speak_listening.dart';
import 'screens/avatar_result.dart';
import 'screens/sign_to_speak.dart';
import 'screens/practics_videos.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo Sign',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        SecureScreen.routeName: (_) => const SecureScreen(),
        SkipContinueScreen.routeName: (_) => const SkipContinueScreen(),
        GetStartedScreen.routeName: (_) => const GetStartedScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        MainScreen.routeName: (_) => const MainScreen(),
        TypeToGlossScreen.routeName: (_) => const TypeToGlossScreen(),
        GlossScreen.routeName: (_) => const GlossScreen(),
        SignAnimationScreen.routeName: (_) => const SignAnimationScreen(),
        SpeakToSignScreen.routeName: (_) => const SpeakToSignScreen(),
        SpeakListeningScreen.routeName: (_) => const SpeakListeningScreen(),
        AvatarResultScreen.routeName: (_) => const AvatarResultScreen(),
        SignToSpeakScreen.routeName: (_) => const SignToSpeakScreen(),
        PracticeScreen.routeName: (_) => const PracticeScreen(),
      },
    );
  }
}
