import 'package:flutter/material.dart';
import 'package:travel_itinerary_planner/features/home/domain/models/destination_model.dart';
import 'package:travel_itinerary_planner/features/onboarding/presentation/onboarding_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/login_screen.dart';
import 'package:travel_itinerary_planner/features/home/presentation/home_screen.dart';
import 'package:travel_itinerary_planner/features/home/presentation/destination_details_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/sign_up_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/forgot_password_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/otp_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/otpverification_code_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/success_screen.dart';
import 'package:travel_itinerary_planner/features/auth/presentation/travel_preferences.dart';
import 'package:travel_itinerary_planner/features/search/presentation/search_screen.dart';
import 'package:travel_itinerary_planner/splash_screen.dart';

class AppRouter {
  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String login = "/login";
  static const String signUp = "/sign-up";
  static const String forgotpassword = "/forgot-password"; 
  static const String otp = "/otp";
  static const String verificationcode = "/verification-code";
  static const String success = "/success";
  static const String travelpreferences = "/travel-preferences";
  static const String home = "/home";
  static const String search = "/search";
  static const String destinationDetails = "/destination-details";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case forgotpassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case otp:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());

      case verificationcode:
        return MaterialPageRoute(builder: (_) => const VerificationCodeScreen());

      case success:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => SuccessScreen(
            title: args['title'],
            description: args['description'],
            nextRoute: args['nextRoute'],
          ),
        );

      case travelpreferences:
        return MaterialPageRoute(builder: (_) => const TravelPreferencesScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      
      case destinationDetails:
        final destination = settings.arguments as DestinationModel;
        return MaterialPageRoute(
          builder: (_) => DestinationDetailsScreen(
            destination: destination,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}