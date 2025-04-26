import 'package:flutter/material.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multilingual Travel Guide',
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NavigationMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}