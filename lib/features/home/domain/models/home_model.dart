import 'destination_model.dart';
import 'hotel_model.dart';

class HomeModel {
  final List<TopImageModel> topImages;
  final List<DestinationModel> destinations;
  final List<HotelModel> hotels;

  HomeModel({
    required this.topImages,
    required this.destinations,
    required this.hotels,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      topImages: (json['topImages'] as List)
          .map((e) => TopImageModel.fromJson(e))
          .toList(),
      destinations: (json['destinations'] as List)
          .map((e) => DestinationModel.fromJson(e))
          .toList(),
      hotels: (json['hotels'] as List)
          .map((e) => HotelModel.fromJson(e))
          .toList(),
    );
  }
}

class TopImageModel {
  final String image;
  final String title;

  TopImageModel({
    required this.image,
    required this.title,
  });

  factory TopImageModel.fromJson(Map<String, dynamic> json) {
    return TopImageModel(
      image: json['image'],
      title: json['title'],
    );
  }
}
