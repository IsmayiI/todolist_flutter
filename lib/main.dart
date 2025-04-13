import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
        ),
        scaffoldBackgroundColor: Colors.yellow[200],
      ),
      home: const HomePage(),
    );
  }
}
