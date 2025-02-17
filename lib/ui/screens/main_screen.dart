import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/screens/profile_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    ProfileScreen(),
    HomeScreen(),
    CartScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF000AFF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withValues(alpha: 0.5),
        currentIndex: _selectedIndex,
        iconSize: 32,
        onTap: _onItemTapped,
        items: _navBarItems()
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Профиль',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Главная',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket),
        label: 'Корзина',
      ),
    ];
  }
}