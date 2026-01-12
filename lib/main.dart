import 'package:flutter/material.dart';
import 'package:foodytn/screens/discovery/discovery_screen.dart';
import 'package:foodytn/screens/search/search_screen.dart';
import 'package:foodytn/screens/filter/filter_screen.dart';
import 'package:foodytn/screens/profile/profile_screen.dart';

void main() {
  runApp(const FoodyTnApp());
}

class FoodyTnApp extends StatelessWidget {
  const FoodyTnApp({super.key});

  static const _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodyTn',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          secondary: const Color(0xFF6A6F7D),
        ),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: const CardThemeData(
          shape: _cardShape,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DiscoveryScreen(),
    SearchScreen(),
    FilterScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: const Color(0xFF6A6F7D),
        onTap: _onItemTapped,
      ),
    );
  }
}