import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:taste_application/SecondaryScreens/login_screen.dart';

class TasteSplashScreen extends StatelessWidget {
  const TasteSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor: const Color.fromARGB(255, 218, 64, 74),
      logoWidth: 150,
      loaderColor: Colors.white.withOpacity(0.7),
      logo: Image.asset(
        "Images/WLogoWithTitleNbg.png",
      ),
      showLoader: true,
      navigator: TasteLoginScreen(),
      durationInSeconds: 3,
    );
  }
}
