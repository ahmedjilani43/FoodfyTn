import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../../services/api_service.dart';
import '../../widgets/restaurant_card.dart';
import '../../core/routes.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Restaurant>> _restaurantsFuture;

  @override
  void initState() {
    super.initState();
    _restaurantsFuture = _apiService.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("FoodyTn", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Discover\nTunisian Tastes",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Restaurant>>(
                future: _restaurantsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.indigo));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  final restaurants = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.details,
                            arguments: restaurants[index],
                          );
                        },
                        child: RestaurantCard(restaurant: restaurants[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}