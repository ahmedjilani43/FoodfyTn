import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;

  // Pop Up
  void _showNotificationDialog(bool value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: isDarkModeEnabled ? Colors.grey[850] : Colors.white,
          title: Row(
            children: [
              Icon(
                value ? Icons.notifications_active : Icons.notifications_off,
                color: Colors.indigo,
              ),
              const SizedBox(width: 10),
              Text(
                value ? "Enabled" : "Disabled",
                style: TextStyle(
                    color: isDarkModeEnabled ? Colors.white : Colors.black),
              ),
            ],
          ),
          content: Text(
            value
                ? "You will now receive real-time notifications."
                : "Notifications are now turned off.",
            style: TextStyle(
                color: isDarkModeEnabled ? Colors.white70 : Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK",
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.indigo,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: isDarkModeEnabled ? Colors.grey[900] : Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isDarkModeEnabled
                                        ? Colors.grey[900]!
                                        : Colors.white,
                                    width: 5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.blueGrey,
                                  child: FaIcon(
                                    FontAwesomeIcons.crown,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Hanine Hammami",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkModeEnabled
                                      ? Colors.white
                                      : Colors.black,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    Divider(
                      color: isDarkModeEnabled ? Colors.white24 : Colors.grey,
                      thickness: 1,
                      indent: 50,
                      endIndent: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: isDarkModeEnabled ? 0 : 2,
                  color: isDarkModeEnabled ? Colors.grey[850] : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text("Enable Notifications",
                            style: TextStyle(
                                color: isDarkModeEnabled
                                    ? Colors.white
                                    : Colors.black)),
                        secondary: const FaIcon(FontAwesomeIcons.bell,
                            color: Colors.indigo, size: 20),
                        value: isNotificationsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            isNotificationsEnabled = value;
                          });
                          _showNotificationDialog(value);
                        },
                      ),
                      const Divider(indent: 20, endIndent: 20),
                      SwitchListTile(
                        title: Text("Dark Mode",
                            style: TextStyle(
                                color: isDarkModeEnabled
                                    ? Colors.white
                                    : Colors.black)),
                        secondary: const FaIcon(FontAwesomeIcons.moon,
                            color: Colors.indigo),
                        value: isDarkModeEnabled,
                        onChanged: (bool value) =>
                            setState(() => isDarkModeEnabled = value),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
                thickness: 0.8,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.favorites),
                  icon: const FaIcon(FontAwesomeIcons.solidHeart, size: 18),
                  label: const Text("Go to Favorites (Teammate 4)"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
