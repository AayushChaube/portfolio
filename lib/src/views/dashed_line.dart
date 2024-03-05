import 'package:flutter/material.dart';

// const int _DefaultDashes = 20;
const Color _DefaultColor = Color(0);
const double _DefaultGapSize = 3.0;
const double _DefaultStrokeWidth = 2.5;
const double _defaultDashHeight = 5;

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final double dashHeight;

  const DashedLine(
      {super.key,
      required this.height,
      this.color = _DefaultColor,
      this.gapSize = _DefaultGapSize,
      this.strokeWidth = _DefaultStrokeWidth,
      this.dashHeight = _defaultDashHeight});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(0, height),
      painter: DashedLinePainter(
        color: color,
        gapSize: gapSize,
        strokeWidth: strokeWidth,
        dashHeight: dashHeight,
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final double dashHeight;

  DashedLinePainter(
      {this.color = _DefaultColor,
      this.gapSize = _DefaultGapSize,
      this.strokeWidth = _DefaultStrokeWidth,
      this.dashHeight = _defaultDashHeight});

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = _DefaultStrokeWidth
      ..style = PaintingStyle.stroke;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);

      startY += dashHeight + gapSize;
    }
  }

  @override
  bool shouldRepaint(covariant DashedLinePainter oldDelegate) {
    return false;
  }
}
