import 'package:flutter/material.dart';
import 'dart:math';

class VerticalArcPainter extends CustomPainter {
  final double progress;
  final double height;
  final double width;
  final Color color;

  VerticalArcPainter({
    required this.progress,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double halfHeight = height / 2;
    final double startAngle = 100; // Start angle is set to 6 o'clock position
    final double sweepAngle = pi * progress;

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromPoints(
        Offset(size.width / 2 - halfHeight, 0),
        Offset(size.width / 2 + halfHeight, height),
      ),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class VerticalArcProgressIndicator extends StatelessWidget {
  final double progress; // Progress value (between 0 and 1)
  final double height; // Height of the arc
  final double width; // Width of the arc
  final Color color; // Color of the arc

  VerticalArcProgressIndicator({
    required this.progress,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VerticalArcPainter(
        progress: progress,
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
