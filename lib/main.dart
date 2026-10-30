import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme.dart';

void main() => runApp(const HarianKuApp());

class HarianKuApp extends StatelessWidget {
  const HarianKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HarianKu',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const SplashScreen(),
    );
  }
}
