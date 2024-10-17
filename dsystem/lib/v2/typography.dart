part of 'export.dart';

// v2 Typography Extension
class TypographyExtension extends ThemeExtension<TypographyExtension> {
  final TextStyle headingStyle;
  final TextStyle bodyStyle;

  TypographyExtension({
    required this.headingStyle,
    required this.bodyStyle,
  });

  @override
  TypographyExtension copyWith({
    TextStyle? headingStyle,
    TextStyle? bodyStyle,
  }) {
    return TypographyExtension(
      headingStyle: headingStyle ?? this.headingStyle,
      bodyStyle: bodyStyle ?? this.bodyStyle,
    );
  }

  @override
  TypographyExtension lerp(
      ThemeExtension<TypographyExtension>? other, double t) {
    if (other is! TypographyExtension) {
      return this;
    }
    return TypographyExtension(
      headingStyle: TextStyle.lerp(headingStyle, other.headingStyle, t)!,
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t)!,
    );
  }

  static final TypographyExtension light = TypographyExtension(
    headingStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black54,
    ),
  );
  static final TypographyExtension dark = TypographyExtension(
    headingStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  );
}
