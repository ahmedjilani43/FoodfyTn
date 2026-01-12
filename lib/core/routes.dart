import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../screens/discovery/discovery_screen.dart';
import '../screens/details/restaurant_details_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/filter/filter_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/favorites/favorites_screen.dart';

class AppRoutes {
  static const String root = '/';
  static const String details = '/details';
  static const String search = '/search';
  static const String filter = '/filter';
  static const String profile = '/profile';
  static const String favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => {
    root: (context) => const MainScaffold(),
    details: (context) => const RestaurantDetailsScreen(),
    search: (context) => const SearchScreen(),
    filter: (context) => const FilterScreen(),
    profile: (context) => const ProfileScreen(),
    favorites: (context) => const FavoritesScreen(),
  };
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DiscoveryScreen(),
    const SearchScreen(),
    const FilterScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (idx) => setState(() => _selectedIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Discovery'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.tune_outlined), selectedIcon: Icon(Icons.tune), label: 'Filter'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}