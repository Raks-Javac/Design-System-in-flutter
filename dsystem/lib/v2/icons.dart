part of 'export.dart';

class AppIconsV2ThemeExtension
    extends ThemeExtension<AppIconsV2ThemeExtension> {
  final IconData homeIcon;
  final IconData searchIcon;
  final IconData settingsIcon;
  final IconData userIcon;

  AppIconsV2ThemeExtension({
    required this.homeIcon,
    required this.searchIcon,
    required this.settingsIcon,
    required this.userIcon,
  });

  @override
  AppIconsV2ThemeExtension copyWith({
    IconData? homeIcon,
    IconData? searchIcon,
    IconData? settingsIcon,
    IconData? userIcon,
  }) {
    return AppIconsV2ThemeExtension(
      homeIcon: homeIcon ?? this.homeIcon,
      searchIcon: searchIcon ?? this.searchIcon,
      settingsIcon: settingsIcon ?? this.settingsIcon,
      userIcon: userIcon ?? this.userIcon,
    );
  }

  @override
  AppIconsV2ThemeExtension lerp(
      ThemeExtension<AppIconsV2ThemeExtension>? other, double t) {
    if (other is! AppIconsV2ThemeExtension) return this;
    return AppIconsV2ThemeExtension(
      homeIcon: homeIcon, // Icons are static, no lerping needed
      searchIcon: searchIcon,
      settingsIcon: settingsIcon,
      userIcon: userIcon,
    );
  }

  static final light = AppIconsV2ThemeExtension(
    homeIcon: Icons.home,
    searchIcon: Icons.search,
    settingsIcon: Icons.settings,
    userIcon: Icons.person,
  );

  static final dark = AppIconsV2ThemeExtension(
    homeIcon: Icons.home_outlined,
    searchIcon: Icons.search_outlined,
    settingsIcon: Icons.settings_outlined,
    userIcon: Icons.person_outline,
  );
}
