import 'package:flutter/material.dart';
import 'package:enigmalab/utils/app_themes.dart';
import 'package:enigmalab/views/screens/login_screen.dart';
import 'package:enigmalab/views/screens/home_screen.dart';
import 'package:enigmalab/views/screens/editor_screen.dart';
import 'package:enigmalab/views/screens/question_answer_screen.dart';
import 'package:enigmalab/views/screens/ai_answer_screen.dart';
import 'package:enigmalab/views/screens/examples_screen.dart';
import 'package:enigmalab/views/screens/profile_screen.dart';
import 'package:enigmalab/views/screens/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Main part of the application
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.normalTheme,
      home: const ProfileScreen(),
    );
  }
}
