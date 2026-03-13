import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/onbording/onboarding_screen.dart';
import '../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/Images/Group 44.png', width: 150)),
          const _FooterLogo(),
        ],
      ),
    );
  }
}

class _FooterLogo extends StatelessWidget {
  const _FooterLogo();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image.asset('assets/Images/Mask group.png', height: 60),
          const SizedBox(height: 10),
          const Text(
            'Supervised by Mohamed Nabil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
