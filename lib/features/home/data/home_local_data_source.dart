import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travel_itinerary_planner/features/home/domain/models/home_model.dart';

class HomeLocalDataSource {
  Future<HomeModel> loadHomeData() async {
    final jsonString =
        await rootBundle.loadString('assets/data/home.json');

    final jsonMap = json.decode(jsonString);

    return HomeModel.fromJson(jsonMap);
  }
}
