import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/router/app_router.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState
    extends State<OtpVerificationScreen> {

  final TextEditingController _emailController =
      TextEditingController();

  bool _isLoading = false;

  void _onVerify() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email"),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    /// Navigate to next step (you can change route later)
    Navigator.pushNamed(context, AppRouter.verificationcode);
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

              const SizedBox(height: 40),

              /// 🔹 Top Illustration
              Center(
                child: Image.asset(
                  "assets/images/otp.png",
                  height: 220,
                ),
              ),

              const SizedBox(height: 40),

              /// 🔹 Title
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// 🔹 Subtitle
              const Text(
                "Enter email and phone number to send one time Password",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              /// 🔹 Email Field
              AppTextField(
                label: "Email",
                hint: "Enter your email",
                controller: _emailController,
                keyboardType:
                    TextInputType.emailAddress,
              ),

              const SizedBox(height: 40),

              /// 🔹 Verify Button
              PrimaryButton(
                title: "Verify",
                onPressed: _onVerify,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
