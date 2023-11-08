
import 'package:flutter/material.dart';

@immutable
class ColorsThemeExtention extends ThemeExtension<ColorsThemeExtention> {
  final List<Color> categoryBgColor;

  const ColorsThemeExtention({
  
    required this.categoryBgColor,
  
  });

  @override
  ThemeExtension<ColorsThemeExtention> copyWith(
      {Color? floatingBgColor, Color? floatingIconColor}) {
    return ColorsThemeExtention(
      categoryBgColor: categoryBgColor,
    );
  }

  @override
  ThemeExtension<ColorsThemeExtention> lerp(
      ThemeExtension<ColorsThemeExtention>? other, double t) {
    if (other is! ColorsThemeExtention) {
      return this;
    }
    return ColorsThemeExtention(
      categoryBgColor: other.categoryBgColor,
    );
  }

  static const light = ColorsThemeExtention(
    categoryBgColor: [
      Color(0xff0AA957),
      Color(0xff69FFB2),
    ],
  );

  
}
