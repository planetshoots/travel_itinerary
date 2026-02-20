import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmController =
      TextEditingController();

  bool _isLoading = false;

  void _onReset() async {
    if (_passwordController.text !=
        _confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(
        const Duration(seconds: 1)); // simulate API

    setState(() => _isLoading = false);

    Navigator.pushNamed(
      context,
      AppRouter.otp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30),

              /// 🔹 Image
              Center(
                child: Image.asset(
                  "assets/images/forgotpassword.png",
                  height: 200,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Reset your Password and make strong.",
                style:
                    TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              const Text(
                "Password Requirement:",
                style: TextStyle(
                    fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              const Text("• At least 8 Characters"),
              const Text("• No Part Of your Username"),
              const Text(
                  "• Your Password Cannot Be any your last 4 Passwords."),

              const SizedBox(height: 30),

              /// 🔹 New Password
              AppTextField(
                label: "New Password",
                hint: "Enter new password",
                controller: _passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              /// 🔹 Confirm Password
              AppTextField(
                label: "Re-enter Password",
                hint: "Confirm password",
                controller: _confirmController,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              /// 🔹 Reset Button
              PrimaryButton(
                title: "Reset Password",
                onPressed: _onReset,
                isLoading: _isLoading,
              ),

              const SizedBox(height: 20),

              /// 🔹 Back to Sign In
              Row(
                children: [
                  const Icon(Icons.arrow_back,
                      size: 16),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back to Sign in",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
