import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primary,
    required this.background,
    required this.black,
    required this.grey,
    required this.greyExt1,
    required this.white,
  });

  final Color primary;
  final Color background;
  final Color black;
  final Color grey;
  final Color greyExt1;
  final Color white;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) => this;

  @override
  ThemeExtension<AppColors> copyWith() => this;
}
