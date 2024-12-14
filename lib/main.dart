import 'package:flutter/material.dart';
import 'package:food_app/ui/model/onboarding_screen.dart';
import 'package:food_app/ui/utils/inputDecoration_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Food',
      theme: ThemeData(
        inputDecorationTheme: CustomInputDecoration.inputDecoration(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}