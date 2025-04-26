import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

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
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
            NavigationDestination(icon: Icon(Icons.account_box), label: 'Profile'),
          ]
        ),
      body: SafeArea(child: _getBody()),
    );
  }

  Widget _getBody() {
    switch (selectedIndex) {
      case 0:
        return HomeScreen(); // Màn hình chính
      case 1:
        return CategoryScreen(); // Màn hình danh mục
      case 2:
        return Container(color: Colors.blue); // Màn hình hồ sơ
      default:
        return Container();
    }
  }
}