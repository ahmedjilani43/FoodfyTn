import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.asset(
                  restaurant.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: Colors.grey.shade300,
                    child: const Center(child: FaIcon(FontAwesomeIcons.image, size: 40, color: Colors.grey)),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.solidStar, size: 12, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Info Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.utensils, size: 14, color: Colors.blueGrey.shade400),
                    const SizedBox(width: 6),
                    Text(
                      restaurant.category,
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                    const Spacer(),
                    FaIcon(FontAwesomeIcons.locationDot, size: 14, color: Colors.blueGrey.shade400),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        restaurant.location.split(',')[0], // Show city only
                        style: TextStyle(color: Colors.blueGrey.shade600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}