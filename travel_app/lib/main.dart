import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_app/providers/settings_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(), // Tạo instance của provider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Lắng nghe thay đổi locale từ provider
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'Multilingual Travel Guide',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: settingsProvider.appLocale,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: L10n.all,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NavigationMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}
