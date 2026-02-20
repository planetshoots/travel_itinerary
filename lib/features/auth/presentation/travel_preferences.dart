import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_itinerary_planner/features/auth/models/travel_preference_model.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class TravelPreferencesScreen extends StatefulWidget {
  const TravelPreferencesScreen({super.key});

  @override
  State<TravelPreferencesScreen> createState() =>
      _TravelPreferencesScreenState();
}

class _TravelPreferencesScreenState
    extends State<TravelPreferencesScreen> {

  List<TravelPreference> preferences = [];
  bool isLoading = true;
  String title = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    try {
      final String response =
          await rootBundle.loadString(
              'assets/data/travel_preferences.json');

      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> preferencesData = data['preferences'] ?? [];

      setState(() {
        title = data['title'] ?? "Travel Preferences";
        description = data['description'] ?? "Select your travel preferences to personalize your experience.";

        preferences = preferencesData
            .map((e) => TravelPreference.fromJson(e))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading preferences: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                     title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 Chips from JSON
                    Expanded(
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: preferences.map((pref) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.grey.shade300),
                              color: Colors.white,
                            ),
                            child: Text(
                              "${pref.title} ${pref.emoji}",
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    PrimaryButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.success,
                          arguments: {
                            "title": "Success!",
                            "description":
                            "Congratulations! You're now part of the Near Me Community. Your personalized travel experiences await.",
                            "nextRoute": AppRouter.home,
                          },
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
