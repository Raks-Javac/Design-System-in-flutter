library dsystem;

import 'package:flutter/material.dart';

import 'v1/export.dart'; // V1 export
import 'v2/export.dart'; // V2 export

enum DesignSystemVersion { v1, v2 }

class DesignSystem {
  final DesignSystemVersion version;

  DesignSystem({required this.version});

  ThemeData createTheme({required bool isDarkMode}) {
    switch (version) {
      case DesignSystemVersion.v1:
        return DesignSystemV1().createTheme(
          themeMode: isDarkMode ? V1ThemeMode.dark : V1ThemeMode.light,
        );
      case DesignSystemVersion.v2:
        return DesignSystemV2().createV1Theme(
          isDarkMode: isDarkMode ? V2ThemeMode.dark : V2ThemeMode.light,
        );
    }
  }
}

extension DesignSystemContextExtensions on BuildContext {
// getting the current typography being used
  (TextTheme?, TypographyExtension?) get returnCurrentTypography {
    final theme = Theme.of(this);

    // Check if V2 extension exists

    final v2Typography = theme.extension<TypographyExtension>();
    if (v2Typography != null) {
      return (null, v2Typography);
    } else {
      return (theme.textTheme, null);
    }
  }

  (ColorScheme?, PalleteExtension?) get returnCurrentPalette {
    final theme = Theme.of(this);

    // Check if V2 extension exists

    final v2Palette = theme.extension<PalleteExtension>();
    if (v2Palette != null) {
      return (null, v2Palette);
    } else {
      return (theme.colorScheme, null);
    }
  }

  /// Function to determine if V1 or V2 is set
  DesignSystemVersion get activeDesignSystemVersion {
    final theme = Theme.of(this);

    // Check if V2 extension exists (if present, V2 is active)
    if (theme.extension<PalleteExtension>() != null) {
      return DesignSystemVersion.v2;
    }
    // Otherwise, it's V1
    return DesignSystemVersion.v1;
  }

  /// V1 Palette (uses Flutter's default theming)
  ThemeData get v1Theme {
    return Theme.of(this); // V1 uses Flutter's default ThemeData
  }

  /// V2 Palette (uses custom extensions)
  PalleteExtension get v2Palette {
    final theme = Theme.of(this);
    return theme.extension<PalleteExtension>()!;
  }

  /// Access V1 Typography (default Flutter typography)
  TextTheme get v1Typography {
    return Theme.of(this).textTheme; // Accesses default Flutter TextTheme
  }

  /// Access V2 Typography (using custom typography extension)
  TypographyExtension get v2Typography {
    final theme = Theme.of(this);
    return theme.extension<TypographyExtension>()!;
  }

  // Add more V2 extensions as needed, e.g., Icons, Strings, etc.
}
