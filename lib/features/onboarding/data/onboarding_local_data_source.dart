import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travel_itinerary_planner/features/onboarding/model/onboarding_model.dart';

class OnboardingLocalDataSource {
  Future<List<OnboardingModel>> loadOnboardingData() async {
    final jsonString =
        await rootBundle.loadString('assets/data/onboarding.json');

    // Example of fetching from API instead of local JSON
    // final respone = await http.get( Uri.parse('https://example.com/api/onboarding') ); 
    // if response is successful {
    //   final jsonString = response.body;
    // } 

    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList
        .map((e) => OnboardingModel.fromJson(e))
        .toList();
  }
}