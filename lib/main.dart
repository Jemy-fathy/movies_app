import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_colors.dart';
import 'package:movies_app/router/app_router.dart';
import 'package:movies_app/router/page_route_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
