# Dsyetem

Welcome to the Design System repository. This document explains how to use, integrate, and contribute to the design system effectively. The design system is divided into two versions: **V1** and **V2**. Below you'll find instructions on how to implement each version, how to switch between light and dark modes, and how to work with themes and extensions.

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
- [Context Extensions](#context-extensions)
- [Contributing](#contributing)
- [License](#license)

## Overview
This design system provides a set of themes, colors, typography, and components that help ensure consistency across the projects in our organization. It includes:
- **V1**: Basic theme-based implementation without extensions.
- **V2**: Advanced theme-based implementation with support for custom extensions.

## Installation

To start using the design system in your project, add it as a dependency:

```bash
# Add this package to your pubspec.yaml file
dsystem:
  git:
    url: [REPO_URL]


After that, run:

```flutter pub get
```

## Usage
Implementing Design System

```class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.returnCurrentPalette;
    final typography = context.returnCurrentTypography;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: palette.$2?.primaryColor,
        title: Text(
          'DUser App',
          style: typography.$2?.bodyStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello User',
              style: typography.$2?.headingStyle,
              // style: ,
            ),
          ),
        ],
      ),
    );
  }
}
```



## Context Extensions

We’ve provided a set of context extensions that simplify access to theme elements, such as palette and typography. Here’s how you can use them in your code:


```
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

```





Contributing

To contribute to this design system, please follow these steps:

    Fork the repository.
    Create a new branch (feature/new-feature or fix/bug-fix).
    Commit your changes.
    Push your branch.
    Open a pull request.

Please ensure all code changes are covered by appropriate tests, and all documentation updates are included.



License

This project is licensed under the MIT License - see the LICENSE file for details.


```This `README.md` file covers:
- Basic installation and usage of V1 and V2.
- Context extensions for easier theme access.
- Contribution guidelines.

Feel free to modify it based on your team’s specific needs!
```