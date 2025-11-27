import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const WindsApp());
}

class WindsApp extends StatelessWidget {
  const WindsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WT winds',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}
