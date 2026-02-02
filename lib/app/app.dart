import 'package:approachable_geek/features/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4169E1)),
        useMaterial3: false,
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      home: const ProfilePage(),
    );
  }
}
