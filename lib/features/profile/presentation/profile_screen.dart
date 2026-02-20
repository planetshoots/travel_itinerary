import 'package:flutter/material.dart';
import '../data/profile_mock_data.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileModel? profile;
  bool isLoading = true;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await ProfileMockData.loadProfile();

    _nameController.text = data.name;
    _emailController.text = data.email;
    _passwordController.text = data.password;
    _dobController.text = data.dob;

    setState(() {
      profile = data;
      isLoading = false;
    });
  }

  Future<void> _saveProfile() async {

    final updatedProfile = ProfileModel(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      dob: _dobController.text,
      image: profile!.image,
    );

    await ProfileMockData.saveProfile(updatedProfile);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated")),
    );
  }

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 20),

              const Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(profile!.image),
              ),

              const SizedBox(height: 40),

              _buildField("Name", _nameController),
              const SizedBox(height: 16),

              _buildField("Email", _emailController),
              const SizedBox(height: 16),

              _buildField("Password", _passwordController),
              const SizedBox(height: 16),

              _buildField("Date of Birth", _dobController),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F80ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Save"),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
