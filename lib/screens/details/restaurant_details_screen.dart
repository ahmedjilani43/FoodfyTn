import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: Colors.indigo,
            leading: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                restaurant.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (c,e,s) => Container(color: Colors.grey),
              ),
              title: Text(restaurant.name),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(label: Text(restaurant.category)),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.solidStar, size: 16, color: Colors.amber),
                          const SizedBox(width: 8),
                          Text("${restaurant.rating}/5.0"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("About", style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Text(restaurant.metadata, style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.blueGrey)),
                  const SizedBox(height: 30),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.locationDot, color: Colors.indigo),
                    title: const Text("Address"),
                    subtitle: Text(restaurant.location),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Favorites - Teammate 4 Task")));
        },
        label: const Text("Favorite"),
        icon: const FaIcon(FontAwesomeIcons.heart),
      ),
    );
  }
}