import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/mock_data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormState>();

  RangeValues _ratingRange = const RangeValues(1.0, 5.0);
  late List<String> _categories;
  final List<String> _selectedCategories = [];
  List<Map<String, dynamic>> _filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    _categories = mockRestaurants
        .map((res) => res['category'] as String)
        .toSet()
        .toList();
    _filteredRestaurants = List.from(mockRestaurants);
  }

  void _applyFilters() {
    setState(() {
      _filteredRestaurants = mockRestaurants.where((restaurant) {
        final matchesCategory = _selectedCategories.isEmpty ||
            _selectedCategories.contains(restaurant['category']);
        final matchesRating = restaurant['rating'] >= _ratingRange.start &&
            restaurant['rating'] <= _ratingRange.end;
        return matchesCategory && matchesRating;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filter Preferences")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: FaIcon(
                  FontAwesomeIcons.sliders,
                  size: 50,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Rating Range:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                values: _ratingRange,
                min: 1.0,
                max: 5.0,
                divisions: 40,
                labels: RangeLabels(
                  _ratingRange.start.toStringAsFixed(1),
                  _ratingRange.end.toStringAsFixed(1),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _ratingRange = values;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Categories:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 10,
                children: _categories.map((category) {
                  final isSelected = _selectedCategories.contains(category);
                  return FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _applyFilters,
                  child: const Text("Apply"),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _filteredRestaurants.isEmpty
                    ? const Center(child: Text("No restaurants found."))
                    : ListView.builder(
                  itemCount: _filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = _filteredRestaurants[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.restaurant, color: Colors.indigo),
                        title: Text(restaurant['name']),
                        subtitle: Text(
                            "${restaurant['category']} - ⭐ ${restaurant['rating']}"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}