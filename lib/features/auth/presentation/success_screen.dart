import 'package:flutter/material.dart';
import '../../../core/widgets/primary_button.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String description;
  final String nextRoute;

  const SuccessScreen({
    super.key,
    required this.title,
    required this.description,
    required this.nextRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Success Icon (your existing asset)
              Image.asset(
                "assets/images/success.png",
                height: 120,
              ),

              const SizedBox(height: 40),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 40),

              PrimaryButton(
                title: "Continue",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    nextRoute,
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
