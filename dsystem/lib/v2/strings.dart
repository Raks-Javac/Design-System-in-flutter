part of 'export.dart';

class AppStringsV2ThemeExtension
    extends ThemeExtension<AppStringsV2ThemeExtension> {
  final String appName;
  final String homeScreenTitle;
  final String searchScreenTitle;
  final String settingsScreenTitle;

  AppStringsV2ThemeExtension({
    required this.appName,
    required this.homeScreenTitle,
    required this.searchScreenTitle,
    required this.settingsScreenTitle,
  });

  @override
  AppStringsV2ThemeExtension copyWith({
    String? appName,
    String? homeScreenTitle,
    String? searchScreenTitle,
    String? settingsScreenTitle,
  }) {
    return AppStringsV2ThemeExtension(
      appName: appName ?? this.appName,
      homeScreenTitle: homeScreenTitle ?? this.homeScreenTitle,
      searchScreenTitle: searchScreenTitle ?? this.searchScreenTitle,
      settingsScreenTitle: settingsScreenTitle ?? this.settingsScreenTitle,
    );
  }

  @override
  AppStringsV2ThemeExtension lerp(
      ThemeExtension<AppStringsV2ThemeExtension>? other, double t) {
    if (other is! AppStringsV2ThemeExtension) return this;
    return AppStringsV2ThemeExtension(
      appName: appName,
      homeScreenTitle: homeScreenTitle,
      searchScreenTitle: searchScreenTitle,
      settingsScreenTitle: settingsScreenTitle,
    );
  }

  static final light = AppStringsV2ThemeExtension(
    appName: "DsApp2",
    homeScreenTitle: "Home",
    searchScreenTitle: "Search",
    settingsScreenTitle: "Settings",
  );

  static final dark = AppStringsV2ThemeExtension(
    appName: "DsApp2 Dark",
    homeScreenTitle: "Home",
    searchScreenTitle: "Search",
    settingsScreenTitle: "Settings",
  );
}
