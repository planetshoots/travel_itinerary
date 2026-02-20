import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/features/home/domain/models/destination_model.dart';

//WishlistManager can notify UI when something changes.
class WishlistManager extends ChangeNotifier {
  final List<DestinationModel> _favorites = []; // this is the state

  List<DestinationModel> get favorites => _favorites;

  bool isFavorite(DestinationModel destination) {
    return _favorites.any((d) => d.title == destination.title);
  }

  void toggleFavorite(DestinationModel destination) { // only this function changes the state
    if (isFavorite(destination)) {
      _favorites.removeWhere((d) => d.title == destination.title);
    } else {
      _favorites.add(destination);
    }
    notifyListeners(); // all listening UI widgets will automatically updates.
  }
}
