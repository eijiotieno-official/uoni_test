import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

/// The main entry point of the application.
///
/// This widget serves as the root of the widget tree and configures the
/// overall theme and initial screen of the app.
class MainApp extends StatelessWidget {
  /// Constructs a [MainApp] instance with the given [key].
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configures the light theme with Material 3 design elements.
      theme: ThemeData.light(useMaterial3: true),

      // Configures the dark theme with Material 3 design elements.
      darkTheme: ThemeData.dark(useMaterial3: true),

      // Sets the theme mode to follow the system theme preference.
      themeMode: ThemeMode.system,

      // Sets the initial screen to the login page.
      home: const LoginPage(),
    );
  }
}
