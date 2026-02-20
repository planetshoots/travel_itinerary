import '../model/profile_model.dart';

class ProfileMockData {

  /// 🔹 In-memory storage
  /// used a static in-memory data source to simulate persistent storage.
  static ProfileModel _profile = ProfileModel( // static means single shared instance
    name: "Melissa Peters",
    email: "melpeters@gmail.com",
    password: "************",
    dob: "23/05/1995",
    image: "assets/images/edit_profile.png",
  );

  static Future<ProfileModel> loadProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _profile;
  }

  static Future<void> saveProfile(ProfileModel updatedProfile) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _profile = updatedProfile;
  }
}
