part of 'export.dart';

class PalleteExtension extends ThemeExtension<PalleteExtension> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;
  final Color? textColor;

  PalleteExtension({
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.textColor,
  });

  @override
  PalleteExtension copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return PalleteExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  PalleteExtension lerp(ThemeExtension<PalleteExtension>? other, double t) {
    if (other is! PalleteExtension) return this;
    return PalleteExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }

  static final light = PalleteExtension(
    primaryColor: const Color(0xFF6200EA),
    secondaryColor: const Color(0xFF03DAC5),
    backgroundColor: const Color(0xFFFFFFFF),
    textColor: const Color(0xFF000000),
  );

  static final dark = PalleteExtension(
    primaryColor: const Color(0xFFBB86FC),
    secondaryColor: const Color(0xFF03DAC5),
    backgroundColor: const Color(0xFF121212),
    textColor: const Color(0xFFFFFFFF),
  );
}
