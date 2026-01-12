import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: [foulen 2 TASK]
    // 1. Build a Form with RangeSlider and FilterChips
    return Scaffold(
      appBar: AppBar(title: const Text("Filter Preferences")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.sliders, size: 50, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text("Form & Input Module\n(Assigned to Teammate 2)", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}