import 'package:flutter/material.dart';
import 'screens/discovery/discovery_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/filter/filter_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'services/session_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logged = await SessionService.isLogged();
  runApp(FoodyTnApp(startRoute: logged ? '/' : '/login'));
}

class FoodyTnApp extends StatelessWidget {
  final String startRoute;
  const FoodyTnApp({super.key, required this.startRoute});

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
        cardTheme: const CardThemeData(shape: _cardShape),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: startRoute,
      routes: {
        '/': (_) => const MainNavigation(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
      },
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
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discovery'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Filter'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: const Color(0xFF6A6F7D),
        onTap: _onItemTapped,
      ),
    );
  }
}
