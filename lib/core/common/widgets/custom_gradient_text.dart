import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment begin;
  final Alignment end;

  const GradientText({
    super.key,
    required this.text,
    this.colors = const [Color(0xFF2AFF83), Color(0xFFFFFFFF)],
    this.fontSize = 28,
    this.fontWeight = FontWeight.w700,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white, // Important for ShaderMask
        ),
      ),
    );
  }
}