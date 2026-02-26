import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/router/app_router.dart';
import 'package:movies_app/router/page_route_names.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',

      // إعداد الثيم العام للتطبيق عشان يريحك في الشغل بعدين
      theme: ThemeData(
        brightness: Brightness.dark, // عشان يظبط ألوان السيستم على الأسود
        scaffoldBackgroundColor: AppColors.bgBlack,
        fontFamily: 'Inter', // لو عندك خط معين ضيفه هنا في الـ pubspec.yaml
      ),

      initialRoute: PageRouteNames.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
