import 'package:flutter/material.dart';

class CustomGradientBoxDecoration extends BoxDecoration {
   CustomGradientBoxDecoration({
    Color? color,
    required List<Color> gradientColors,
    List<double>? gradientStops,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    double gradientRotation = 0.0,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          gradient: LinearGradient(
            colors: gradientColors,
            stops: gradientStops,
            begin: begin,
            end: end,
            transform: GradientRotation(gradientRotation),
          ),
          color: color,
          borderRadius: borderRadius,
        );
}

