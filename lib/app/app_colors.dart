import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.primary,
    required this.background,
    required this.black,
    required this.grey,
    required this.greyExt1,
    required this.greyExt2,
    required this.white,
    required this.error,
  });

  final Color primary;
  final Color background;
  final Color black;
  final Color grey;
  final Color greyExt1;
  final Color greyExt2;
  final Color white;
  final Color error;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) => this;

  @override
  ThemeExtension<AppColors> copyWith() => this;
}
