import 'package:geniouscart/Theme/Themes.dart';
import 'package:flutter/material.dart';

Widget CircularProgress(
    {double size = 20, Color color, double width = 2, Alignment alignment=Alignment.center}) {
  return Align(
    alignment: alignment,
    child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
          strokeWidth: width,
          valueColor: AlwaysStoppedAnimation<Color>(
              color == null ? Themes.Primary : color)),
    ),
  );
}
