import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wallpaper_ui/core/utils/approute.dart';
import 'package:wallpaper_ui/core/utils/assets.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/core/utils/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Utilisez AppRoute pour naviguer vers la page d'accueil
      AppRoute.router.go(AppRoute.kHome);
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.splashImg), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(nameApp, style: Styles.sTyleSplash),
                const SizedBox(height: 20),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(descriptionAPP,
                        textStyle: Styles.sTyle1,
                        speed: const Duration(milliseconds: 70),
                        textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
