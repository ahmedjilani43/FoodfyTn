import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: [foulen 3 TASK]
    // 1. Build Profile UI and Settings toggles
    // 2. Link button to FavoritesScreen
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.userAstronaut, size: 50, color: Colors.blueGrey),
            const SizedBox(height: 20),
            const Text("Profile & Settings Module\n(Assigned to Teammate 3)", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.favorites),
              child: const Text("Go to Favorites (Teammate 4)"),
            ),
          ],
        ),
      ),
    );
  }
}