# Dsyetem

Welcome to the Design System repository. This document explains how to use, integrate, and contribute to the design system effectively. The design system is divided into two versions: **V1** and **V2**. Below you'll find instructions on how to implement each version, how to switch between light and dark modes, and how to work with themes and extensions.

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
- [Usage](#usage)
  - [Using V1 Design System](#using-v1-design-system)
  - [Using V2 Design System](#using-v2-design-system)
  - [Switching Between Light and Dark Modes](#switching-between-light-and-dark-modes)
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
Using V1 Design System

V1 is the basic version of the design system that doesn't rely on extensions. To use V1, import the v1 design system and follow the setup:

```import 'package:dsystem/v1/export.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = V1ThemeMode.light; // or V1ThemeMode.dark
    return MaterialApp(
      theme: DesignSystemV1().createTheme(themeMode: themeMode),
      home: HomeScreen(),
    );
  }
}
```

Using V2 Design System

V2 supports theme extensions and provides additional customization options. To use V2, import the v2 design system and configure it accordingly:


import 'package:dsystem/v2/export.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = V2ThemeMode.light; // or V2ThemeMode.dark
    return MaterialApp(
      theme: DesignSystemV2().createV1Theme(isDarkMode: themeMode),
      home: HomeScreen(),
    );
  }
}


Context Extensions

We’ve provided a set of context extensions that simplify access to theme elements, such as palette and typography. Here’s how you can use them in your code:


Access V1 Palette

```import 'package:dsystem/context_extensions.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.v1Palette;
    return Container(
      color: palette.primaryColor,
      child: Text('Hello World', style: TextStyle(color: palette.secondaryColor)),
    );
  }
}
```

and vice versa for typography and other components in v1


Access V2 Palette

````import 'package:dsystem/context_extensions.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.v2Palette;
    return Container(
      color: palette.primaryColor,
      child: Text('Hello World', style: TextStyle(color: palette.secondaryColor)),
    );
  }
}
```

and vice versa for typography and other components in v2.


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
- Switching between light and dark themes.
- Context extensions for easier theme access.
- Contribution guidelines.

Feel free to modify it based on your team’s specific needs!
```