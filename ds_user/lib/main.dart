import 'package:dsystem/dsystem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DSUserApp());
}

const DesignSystemVersion version = DesignSystemVersion.v2;

class DSUserApp extends StatefulWidget {
  const DSUserApp({super.key});
  @override
  State<DSUserApp> createState() => _DSUserAppState();
}

class _DSUserAppState extends State<DSUserApp> {
  final bool _themeMode = true;

  // Choose the version
  @override
  Widget build(BuildContext context) {
    final designSystem = DesignSystem(version: version);

    return MaterialApp(
      title: 'DSUser App',
      theme: designSystem.createTheme(isDarkMode: _themeMode), // Light Theme
      darkTheme: designSystem.createTheme(isDarkMode: _themeMode), // Dark Theme
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue, // Global color scheme using Material Design
        scaffoldBackgroundColor: Colors.white, // Background color for the app
        textTheme: const TextTheme(
          // Customizes text styles globally for consistency
          bodyMedium: TextStyle(
              fontSize: 18, color: Colors.black), // Standard text style
        ),
        buttonTheme: const ButtonThemeData(
          // Customize button styles globally
          buttonColor: Colors.blue, // Default button color
          textTheme:
              ButtonTextTheme.primary, // Button text color to be primary color
        ),
        // Other component styling can come in here
      ),
      home: const MyHomePage(), // a typical reusable widget
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Sets the AppBar background color using the primary color from the theme
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Hello App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              // Applies the bodyMediumm text style from the theme for consistent typography
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

//// Custom Typography Extension
class TypographyExtension extends ThemeExtension<TypographyExtension> {
  final TextStyle bodyMedium;

  TypographyExtension({required this.bodyMedium});

  @override
  TypographyExtension copyWith({TextStyle? bodyMedium}) =>
      TypographyExtension(bodyMedium: bodyMedium ?? this.bodyMedium);

  @override
  TypographyExtension lerp(TypographyExtension? other, double t) =>
      TypographyExtension(
        bodyMedium: TextStyle.lerp(bodyMedium, other?.bodyMedium, t)!,
      );

  static final light = TypographyExtension(
    bodyMedium: const TextStyle(fontSize: 24, color: Colors.black),
  );
}

// color pallete

// Custom Color Palette Extension
class PaletteExtension extends ThemeExtension<PaletteExtension> {
  final Color primaryColor;

  PaletteExtension({required this.primaryColor});

  @override
  PaletteExtension copyWith({Color? primaryColor}) =>
      PaletteExtension(primaryColor: primaryColor ?? this.primaryColor);

  @override
  PaletteExtension lerp(PaletteExtension? other, double t) => PaletteExtension(
        primaryColor: Color.lerp(primaryColor, other?.primaryColor, t)!,
      );

  static final light = PaletteExtension(
    primaryColor: Colors.blue,
  );
}

// Registering in ThemeData (Dark)
ThemeData themeLight = ThemeData(
  extensions: [
    TypographyExtension.light, // Custom typography
    PaletteExtension.light, // Custom color palette
  ],
);

// // Registering in ThemeData(Dark)
// ThemeData themeDark = ThemeData(
//   extensions: [
//     TypographyExtension.dark,  // Custom typography
//     PaletteExtension.dark,     // Custom color palette
//   ],
// );

class ExtensionApp extends StatelessWidget {
  const ExtensionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set theme mode for the app here
      themeMode: ThemeMode.light,
      // set initialized ThemeDate
      theme: themeLight,
      home: const ExtensionAppHomePage(),
    );
  }
}

// Add contect extensions to access theme extensions easily
extension ExtensionAppTExt on BuildContext {
  TypographyExtension get typography {
    return Theme.of(this).extension<TypographyExtension>()!;
  }

  PaletteExtension get palette {
    return Theme.of(this).extension<PaletteExtension>()!;
  }
}

// Use the extensions in the widget
class ExtensionAppHomePage extends StatelessWidget {
  const ExtensionAppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = context.typography; // Access custom typography
    final palette = context.palette; // Access custom palette

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            palette.primaryColor, // Set app bar color using custom palette
        title: const Text("Hello App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              style: typography
                  .bodyMedium, // Apply custom text style from typography extension
            ),
          ],
        ),
      ),
    );
  }
}
