library my_design_system;

import 'package:flutter/material.dart';

part 'colors.dart';
part 'icons.dart';
part 'strings.dart';
part 'typography.dart';

enum V1ThemeMode { light, dark }

class DesignSystemV1 {
  // condition for mode
  ThemeData createTheme({required V1ThemeMode themeMode}) {
    final isDark = themeMode == V1ThemeMode.dark;
    return isDark ? light : darkTheme;
  }

  static ThemeData get light => ThemeData(
        primaryColor: AppColorsV1.primaryColor,
        textTheme: const TextTheme(
          displayLarge: AppTypographyV1.heading1,
          bodyLarge: AppTypographyV1.bodyText,
          labelLarge: AppTypographyV1.button,
        ),
        iconTheme: const IconThemeData(
          color: AppColorsV1.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: AppColorsV1.primaryColor,
          iconTheme: const IconThemeData(color: AppColorsV1.secondaryColor),
          toolbarTextStyle: TextTheme(
            titleLarge: AppTypographyV1.heading1.copyWith(fontSize: 20),
          ).bodyMedium,
          titleTextStyle: TextTheme(
            titleLarge: AppTypographyV1.heading1.copyWith(fontSize: 20),
          ).titleLarge,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColorsV1.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      );

  //
  static ThemeData get darkTheme => ThemeData(
        primaryColor: AppColorsV1.primaryColor,
        textTheme: const TextTheme(
          displayLarge: AppTypographyV1.heading1,
          bodyLarge: AppTypographyV1.bodyText,
          labelLarge: AppTypographyV1.button,
        ),
        iconTheme: const IconThemeData(
          color: AppColorsV1.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: AppColorsV1.primaryColor,
          iconTheme: const IconThemeData(color: AppColorsV1.secondaryColor),
          toolbarTextStyle: TextTheme(
            titleLarge: AppTypographyV1.heading1
                .copyWith(fontSize: 20, color: Colors.white),
          ).bodyMedium,
          titleTextStyle: TextTheme(
            titleLarge: AppTypographyV1.heading1
                .copyWith(fontSize: 20, color: Colors.white),
          ).titleLarge,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColorsV1.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      );
}
