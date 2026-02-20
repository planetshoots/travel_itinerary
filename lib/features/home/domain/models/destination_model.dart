class DestinationModel {
  final String image;
  final String title;
  final String country;
  final bool isFavorite;
  final String description;
  final double rating;
  final String reviews;
  final String architecture;
  final String address;

  DestinationModel({
    required this.image,
    required this.title,
    required this.country,
    this.isFavorite = false,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.architecture,
    required this.address,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      image: json['image'],
      title: json['title'],
      country: json['country'],
      isFavorite: json['isFavorite'] ?? false,
      description: json['description'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
      architecture: json['architecture'],
      address: json['address'],
    );
  }
}
