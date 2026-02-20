import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends State<VerificationCodeScreen> {

  final TextEditingController _otpController =
      TextEditingController();

  bool _isLoading = false;

  void _verifyOtp() async {
    if (_otpController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter OTP"),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    /// After successful verification → go to login
    Navigator.pushNamed(
      context,
      AppRouter.success,
      arguments: {
        "title": "Success!",
        "description":
        "Congratulations! You have been successfully authenticated.",
        "nextRoute": AppRouter.travelpreferences,
      },
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

              const SizedBox(height: 20),

              /// 🔹 Back Button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 20),

              /// 🔹 Illustration
              Center(
                child: Image.asset(
                  "assets/images/verificationcode.png",
                  height: 220,
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Title
              const Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// 🔹 Subtitle
              const Text(
                "We have sent the verification code to your email address",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              /// 🔹 OTP Field
              AppTextField(
                label: "OTP",
                hint: "Enter OTP",
                controller: _otpController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 40),

              /// 🔹 Verify Button
              PrimaryButton(
                title: "Verify OTP",
                onPressed: _verifyOtp,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
