import 'dart:async';
import '../models/restaurant.dart';
import '../data/mock_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

extension AcademicApi on ApiService {
  Future<List<Restaurant>> fetchRestaurantsFromApi() async {
    final res = await http.get(
      Uri.parse('https://mocki.io/v1/6c1f6b7e-0a6e-4db3-9b43-9c0f8d8d9c9f'),
    );

    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => Restaurant.fromMap(e)).toList();
    } else {
      throw Exception('Failed to fetch restaurants');
    }
  }
}
