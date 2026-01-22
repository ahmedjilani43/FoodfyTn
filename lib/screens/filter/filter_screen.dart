import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Price range
  RangeValues _priceRange = const RangeValues(20, 100);

  // Categories
  final List<String> _categories = ["Tunisian", "Pizza", "Seafood"];
  final List<String> _selectedCategories = [];

  // Sample list of restaurants
  final List<Map<String, dynamic>> _restaurants = [
    {"name": "El Medina", "price": 30, "category": "Tunisian"},
    {"name": "Pizza House", "price": 50, "category": "Pizza"},
    {"name": "Seafood Palace", "price": 90, "category": "Seafood"},
    {"name": "Fast Pizza", "price": 25, "category": "Pizza"},
    {"name": "Carthage Grill", "price": 70, "category": "Tunisian"},
  ];

  List<Map<String, dynamic>> _filteredRestaurants = [];

  void _applyFilters() {
    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one category.")),
      );
      return;
    }

    setState(() {
      _filteredRestaurants = _restaurants.where((restaurant) {
        final matchesCategory =
            _selectedCategories.contains(restaurant['category']);
        final matchesPrice = restaurant['price'] >= _priceRange.start &&
            restaurant['price'] <= _priceRange.end;
        return matchesCategory && matchesPrice;
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
                "Select Price Range:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                values: _priceRange,
                min: 20,
                max: 100,
                divisions: 8,
                labels: RangeLabels(
                  "${_priceRange.start.toInt()} TND",
                  "${_priceRange.end.toInt()} TND",
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
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
                              title: Text(restaurant['name']),
                              subtitle: Text(
                                  "${restaurant['category']} - ${restaurant['price']} TND"),
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
