import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class StartWatchingScreen extends StatelessWidget {
  const StartWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkGrey,
      body: Stack(
        children: [const _ImageHeader(), const _StartWatchingContent()],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/image copy 2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.bgBlack.withOpacity(0.5),
              AppColors.bgBlack,
            ],
            stops: const [0.6, 0.8, 1.0],
          ),
        ),
      ),
    );
  }
}

class _StartWatchingContent extends StatelessWidget {
  const _StartWatchingContent();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: const BoxDecoration(
          color: AppColors.bgBlack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        ),
        child: Column(
          children: [
            const Text(
              'Start Watching Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Finished Onboarding");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    color: AppColors.bgBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.primaryYellow,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.primaryYellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
