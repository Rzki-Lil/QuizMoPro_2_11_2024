import 'package:flutter/material.dart';
import 'package:level_3/presentation/home/home.dart';
import 'package:level_3/presentation/onBoarding/pages/onboarding_page.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OnboardingPage(),
      ),
    );
  }
}
