// ignore_for_file: file_names

import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(AppRoutes.getStartedScreen);

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: MainColors.boxFillColor,
        width: size.width,
        height: size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child:
                  Image.asset("assets/icons/main.png", height: 100, width: 100),
            ),
            SizedBox(
              width: size.width * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("Welcome to",
                          style: TextStyle(
                            fontFamily: 'rockwell',
                            fontSize: FontSizes.md,
                            color: Colors.white,
                          )),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                          fontSize: FontSizes.lg,
                          fontFamily: 'rockwell',
                          color: MainColors.headingColor),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Crawllet \n The Best Wallet App.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
