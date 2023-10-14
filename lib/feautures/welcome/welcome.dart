import 'package:flutter/material.dart';
import 'package:kncha_app/core/color_manager.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/feautures/home/presentation/pages/home_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            // Agregar la animación de rotación al texto
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText("Bienvenido",
                    textStyle: AppTypography.stRaleway(
                      color: ColorManager.neutral900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                RotateAnimatedText("Espero disfrutes esta app",
                    textStyle: AppTypography.stRaleway(
                      color: ColorManager.neutral900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
