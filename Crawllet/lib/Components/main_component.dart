// ignore_for_file: file_names

import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';

class MainComponent extends StatefulWidget {
  final Widget widget;
  const MainComponent({Key? key, required this.widget}) : super(key: key);

  @override
  State<MainComponent> createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: MainColors.foregroundColor,
      body: SizedBox(
          width: data.size.width,
          height: data.size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(1240, 150),
                  painter: RPSCustomPainter(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: data.viewPadding.top),
                  child: widget.widget,
                ),
              ],
            ),
          )),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 150);
    path_0.lineTo(0, 145);
    path_0.cubicTo(53.3, 180, 107, 128, 160, 112);
    path_0.cubicTo(213.3, 96, 267, 160, 320, 170.7);
    path_0.cubicTo(373.3, 181, 427, 139, 480, 133.3);
    path_0.cubicTo(533.3, 128, 587, 160, 640, 192);
    path_0.cubicTo(693.3, 224, 747, 256, 800, 240);
    path_0.cubicTo(853.3, 224, 907, 160, 960, 133.3);
    path_0.cubicTo(1013.3, 107, 1067, 117, 1120, 122.7);
    path_0.cubicTo(1173.3, 128, 1227, 128, 1280, 112);
    path_0.cubicTo(1333.3, 96, 1387, 64, 1413, 48);
    path_0.lineTo(1440, 32);
    path_0.lineTo(1440, 0);
    path_0.lineTo(1413.3, 0);
    path_0.cubicTo(1386.7, 0, 1333, 0, 1280, 0);
    path_0.cubicTo(1226.7, 0, 1173, 0, 1120, 0);
    path_0.cubicTo(1066.7, 0, 1013, 0, 960, 0);
    path_0.cubicTo(906.7, 0, 853, 0, 800, 0);
    path_0.cubicTo(746.7, 0, 693, 0, 640, 0);
    path_0.cubicTo(586.7, 0, 533, 0, 480, 0);
    path_0.cubicTo(426.7, 0, 373, 0, 320, 0);
    path_0.cubicTo(266.7, 0, 213, 0, 160, 0);
    path_0.cubicTo(106.7, 0, 53, 0, 27, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paintfill = Paint()..style = PaintingStyle.fill;
    paintfill.color = MainColors.backgroundColors;
    canvas.drawPath(path_0, paintfill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
