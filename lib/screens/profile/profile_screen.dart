import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // add variables for the SwitchListTiles
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.indigo, 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            
            // Profile Header
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueGrey, 
                    child: FaIcon(
                      FontAwesomeIcons.userAstronaut,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Hanine Hammami", 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            const Divider(),

            // Settings List using SwitchListTile
            SwitchListTile(
              title: const Text("Enable Notifications"),
              secondary: const FaIcon(FontAwesomeIcons.bell, color: Colors.indigo),
              value: isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            
            SwitchListTile(
              title: const Text("Dark Mode"),
              secondary: const FaIcon(FontAwesomeIcons.moon, color: Colors.indigo),
              value: isDarkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),

            const Divider(),
            const SizedBox(height: 20),

            // 3. Maintain Navigation 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.favorites),
                icon: const FaIcon(FontAwesomeIcons.solidHeart),
                label: const Text("Go to Favorites (Teammate 4)"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}