// ignore_for_file: file_names

import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/Theme/font_sizes.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MainColors.backgroundColors,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPaint(
                  size: const Size(900, 700),
                  painter: RPSCustomPainter(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.6,
                    child: Center(
                        child: Image.asset(
                      "assets/icons/Group5.png",
                      width: 200,
                      height: 200,
                    )),
                  ),
                  Text(
                    "Welcome to Crawllet",
                    style: TextStyle(
                        fontSize: FontSizes.lg,
                        fontFamily: 'rockwell',
                        color: MainColors.headingColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0),
                    child: Text(
                      "It is a simple app to store all your credit card details and manage them with no complications.",
                      style: TextStyle(
                          fontSize: FontSizes.md,
                          fontFamily: 'rockwell',
                          color: MainColors.textColor,
                          letterSpacing: 2.0,
                          wordSpacing: 3.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.loginScreen  );
                      },
                      child: Container(
                          width: size.width * 0.8,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: MainColors.foregroundColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  color: MainColors.textColor,
                                  size: FontSizes.xl,
                                ),
                              ),
                              Text(
                                "Get Started",
                                style: TextStyle(
                                    color: MainColors.textColor,
                                    fontSize: FontSizes.lg,
                                    fontFamily: "harlow"),
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintfill = Paint()..style = PaintingStyle.fill;
    paintfill.color = MainColors.backgroundColors;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paintfill);

    Path path_1 = Path();
    path_1.moveTo(0, 363);
    path_1.lineTo(37.5, 350);
    path_1.cubicTo(75, 337, 150, 311, 225, 289);
    path_1.cubicTo(300, 267, 375, 249, 450, 261.2);
    path_1.cubicTo(525, 273.3, 600, 315.7, 675, 331.3);
    path_1.cubicTo(750, 347, 825, 336, 862.5, 330.5);
    path_1.lineTo(900, 325);
    path_1.lineTo(900, 750);
    path_1.lineTo(862.5, 750);
    path_1.cubicTo(825, 750, 750, 750, 675, 750);
    path_1.cubicTo(600, 750, 525, 750, 450, 750);
    path_1.cubicTo(375, 750, 300, 750, 225, 750);
    path_1.cubicTo(150, 750, 75, 750, 37.5, 750);
    path_1.lineTo(0, 750);
    path_1.close();

    Paint paintfill1 = Paint()..style = PaintingStyle.fill;
    paintfill1.color = Colors.white;
    canvas.drawPath(path_1, paintfill1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
