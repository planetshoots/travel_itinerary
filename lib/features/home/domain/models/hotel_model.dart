class HotelModel {
  final String image;
  final String title;
  final String location;

  HotelModel({
    required this.image,
    required this.title,
    required this.location,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      image: json['image'],
      title: json['title'],
      location: json['location'],
    );
  }
}
