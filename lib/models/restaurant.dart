class Restaurant {
  final String id;
  final String name;
  final String category;
  final double rating;
  final String location;
  final String imageUrl;
  final String metadata;

  Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.location,
    required this.imageUrl,
    required this.metadata,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      location: map['location'] ?? '',
      imageUrl: map['image_url'] ?? '',
      metadata: map['metadata'] ?? '',
    );
  }
}