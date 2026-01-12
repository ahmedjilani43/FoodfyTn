import 'dart:async';
import '../models/restaurant.dart';
import '../data/mock_data.dart';

class ApiService {


  Future<List<Restaurant>> getRestaurants() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return mockRestaurants.map((json) => Restaurant.fromMap(json)).toList();
    } catch (e) {
      throw Exception('Failed to load restaurants: $e');
    }
  }

  Future<List<Restaurant>> searchRestaurants(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final results = mockRestaurants.where((data) {
      final name = data['name'].toString().toLowerCase();
      final category = data['category'].toString().toLowerCase();
      final q = query.toLowerCase();
      return name.contains(q) || category.contains(q);
    }).toList();

    return results.map((json) => Restaurant.fromMap(json)).toList();
  }
}