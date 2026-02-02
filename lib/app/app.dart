import 'dart:io';

import 'package:approachable_geek/app/app_colors.dart';
import 'package:approachable_geek/core/utils/extensions.dart';
import 'package:approachable_geek/features/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        fontFamily: Platform.isIOS ? 'CupertinoSystemText' : 'Inter',
        extensions: <ThemeExtension<dynamic>>[
          AppColors(
            primary: ColorExt.fromHex('#4169E1'),
            background: Colors.white,
            black: Colors.black,
            white: Colors.white,
            grey: Colors.grey,
            greyExt1: Colors.grey.shade500,
          ),
        ],
      ),
      themeMode: ThemeMode.light,
      home: const ProfilePage(),
    );
  }
}
