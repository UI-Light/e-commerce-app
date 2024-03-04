import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/dependencies/registry.dart';
import 'package:shopping_app/core/utils/logger.dart';
import 'package:shopping_app/views/index_page.dart';

void main() {
  AppLogger.configure(showLogs: kDebugMode);
  // String.fromEnvironment reads environment variables that you pass to the
  // flutter run command using --dart-define OR --dart-define-from-file
  registerDependencies(baseUrl: const String.fromEnvironment('BASE_URL'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IndexPage(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0.0),
            minimumSize: const MaterialStatePropertyAll<Size>(Size(160, 40)),
            shape: MaterialStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
