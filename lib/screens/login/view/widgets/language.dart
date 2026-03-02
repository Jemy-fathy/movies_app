import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/constants/app_colors.dart';

class LanguageSelection extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final bool defaultLanguage;

  const LanguageSelection({super.key, required this.defaultLanguage, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return defaultLanguage ? Container(
      width: 0.21*screenWidth,
      height: 0.04077*screenHeight,
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: AppColors.primaryYellow),
      ),
      child: Row(
        children: [ 
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: AppColors.primaryYellow)
            ),
            child: SvgPicture.asset('assets/icons/english.svg')
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset('assets/icons/arabic.svg'),
          ),
        ],
      ),
    ) : 
    Container(
      width: 0.21*screenWidth,
      height: 0.04077*screenHeight,
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: AppColors.primaryYellow),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset('assets/icons/english.svg'),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: AppColors.primaryYellow)
            ),
            child: SvgPicture.asset('assets/icons/arabic.svg'),
          ),
        ],
      ),
    );
  }
}