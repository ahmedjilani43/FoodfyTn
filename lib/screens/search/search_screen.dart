import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: [foulen 1 TASK]
    // 1. Use ApiService().searchRestaurants(query)
    // 2. Display results in a GridView.builder
    return Scaffold(
      appBar: AppBar(title: const Text("Find Restaurants")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 50, color: Colors.blueGrey),
            const SizedBox(height: 20),
            const Text("Search & GridView Module\n(Assigned to Teammate 1)", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}