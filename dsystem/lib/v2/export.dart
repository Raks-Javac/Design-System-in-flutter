import 'package:dsystem/v1/export.dart';
import 'package:flutter/material.dart';

part 'colors.dart';
part 'icons.dart';
part 'strings.dart';
part 'typography.dart';

enum V2ThemeMode { light, dark }

class DesignSystemV2 {
  ThemeData createV1Theme({required V2ThemeMode isDarkMode}) {
    final isDark = isDarkMode == V2ThemeMode.dark;
    return ThemeData(
      primaryColor: AppColorsV1.primaryColor,
      brightness:
          isDarkMode == V2ThemeMode.dark ? Brightness.dark : Brightness.light,
      extensions: [
        isDark ? PalleteExtension.dark : PalleteExtension.light,
        isDark ? TypographyExtension.dark : TypographyExtension.light,
        isDark ? AppIconsV2ThemeExtension.light : AppIconsV2ThemeExtension.dark,
        isDark
            ? AppStringsV2ThemeExtension.light
            : AppStringsV2ThemeExtension.dark,
      ],
      // You can add more properties such as TextTheme, ButtonTheme, etc.
    );
  }
}
