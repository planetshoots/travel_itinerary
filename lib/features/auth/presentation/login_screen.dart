import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import 'package:travel_itinerary_planner/features/auth/domain/usecases/login_usecases.dart';
import 'package:travel_itinerary_planner/core/router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginUseCase _loginUseCase = LoginUseCase();  

  bool _isLoading = false;

  void _onLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    final isValid = _loginUseCase.execute(
      username: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;

    if (isValid) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    } else {
      _showError();
    }
  }

  void _showError() {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Login Failed"),
      content: const Text("Invalid username or password"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
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
                  "assets/signin.png",
                  height: 200,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Please login to continue to your account.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              AppTextField(
                label: "Email",
                hint: "Enter your email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              AppTextField(
                label: "Password",
                hint: "Enter your password",
                controller: _passwordController,
                isPassword: true,
              ),

              /// 🔹 FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.forgotpassword);
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                title: "Sign in",
                onPressed: _onLogin,
                isLoading: _isLoading,
              ),

              const SizedBox(height: 20),

              const Center(child: Text("or")),

              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Sign in with Google"),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Need an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.signUp);
                    },
                    child: const Text(
                      "Create one",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
      
            ],
          ),
        ),
      ),
    );
  }
}