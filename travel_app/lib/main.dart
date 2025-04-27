import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default locale

  void _changeLocale(Locale locale) {
    setState(() {
      _locale = locale; // Update the locale
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multilingual Travel Guide',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: L10n.all,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NavigationMenu(onLocaleChanged: _changeLocale),
      debugShowCheckedModeBanner: false,
    );
  }
}