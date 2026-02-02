import 'package:flutter/material.dart';

// Context Extension
extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get _size => MediaQuery.of(this).size;
  bool get isPortrait => _size.height > _size.width;
  bool get isLandscape => _size.width > _size.height;
  bool get isTabletLandscape => isTablet && isLandscape;

  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 1024;
  bool get isMobileTablet => MediaQuery.of(this).size.width < 1024;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}

extension TextStyleX on TextStyle? {
  TextStyle? get black => this?.copyWith(fontWeight: FontWeight.w900);
  TextStyle? get extrabold => this?.copyWith(fontWeight: FontWeight.w800);
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.w700);
  TextStyle? get semibold => this?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get medium => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get normal => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get light => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get extraLight => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? get thin => this?.copyWith(fontWeight: FontWeight.w100);

  TextStyle? cColor(Color color) => this?.copyWith(color: color);
}

// Color Extension
extension CustomColorScheme on ColorScheme {}
