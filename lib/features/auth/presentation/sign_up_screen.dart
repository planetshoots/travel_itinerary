import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  /// Date Picker
  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      _dobController.text =
          "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  /// Sign Up Logic (Mock)
  void _onSignUp() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    /// Navigate back to Login
    Navigator.pushReplacementNamed(context, AppRouter.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 40),

              Center(
                child: Image.asset(
                  "assets/images/signup.png",
                  height: 200,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sign up to enjoy the feature of Revolutie",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// Name
              AppTextField(
                label: "Your Name",
                hint: "Enter your name",
                controller: _nameController,
              ),

              const SizedBox(height: 20),

              /// Date of Birth
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: AppTextField(
                    label: "Date of Birth",
                    hint: "Select Date",
                    controller: _dobController,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Email
              AppTextField(
                label: "Email",
                hint: "Enter your email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              /// Password
              AppTextField(
                label: "Password",
                hint: "Enter your password",
                controller: _passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              /// Sign Up Button
              PrimaryButton(
                title: "Sign up",
                isLoading: _isLoading,
                onPressed: _onSignUp,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
