import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: [foulen 4 TASK]
    // 1. Implement Shared_Preferences to save/load IDs
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.solidHeart, size: 50, color: Colors.redAccent),
            const SizedBox(height: 20),
            const Text("Local Storage Module\n(Assigned to Teammate 4)", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}