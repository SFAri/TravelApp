import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationMenu extends StatefulWidget {
  final Function(Locale) onLocaleChanged; // Callback for changing locale

  const NavigationMenu({super.key, required this.onLocaleChanged});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withValues(alpha: 0.1),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: AppLocalizations.of(context)!.homeNavigation),
            NavigationDestination(icon: Icon(Icons.category), label: AppLocalizations.of(context)!.categoryNavigation),
          ]
        ),
      body: SafeArea(child: _getBody()),
    );
  }

  Widget _getBody() {
    switch (selectedIndex) {
      case 0:
        return HomeScreen(onLocaleChanged: widget.onLocaleChanged); // Màn hình chính
      case 1:
        return CategoryScreen(); // Màn hình danh mục
      default:
        return Container();
    }
  }
}