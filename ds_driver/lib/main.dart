import 'package:dsystem/dsystem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DSDriverApp());
}

const DesignSystemVersion version = DesignSystemVersion.v1;

class DSDriverApp extends StatefulWidget {
  const DSDriverApp({super.key});
  @override
  State<DSDriverApp> createState() => _DSDriverAppState();
}

class _DSDriverAppState extends State<DSDriverApp> {
  final bool _themeMode = true;

  // Choose the version
  @override
  Widget build(BuildContext context) {
    final designSystem = DesignSystem(version: version);

    return MaterialApp(
      title: 'DSDriver App',
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
          'DsDriver App',
          style: typography.$2?.bodyStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello Driver',
              style: typography.$2?.headingStyle,
              // style: ,
            ),
          ),
        ],
      ),
    );
  }
}
