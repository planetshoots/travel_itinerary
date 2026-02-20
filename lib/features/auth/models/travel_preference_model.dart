class TravelPreference {
  final String title;
  final String emoji;

  TravelPreference({
    required this.title,
    required this.emoji,
  });

  factory TravelPreference.fromJson(Map<String, dynamic> json) {
    return TravelPreference(
      title: json['title'],
      emoji: json['emoji'],
    );
  }
}
