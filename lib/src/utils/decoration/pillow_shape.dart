import 'package:flutter/material.dart';

/// [ShapeBorder] configured to look like a pillow by combining 4 bezier curves.
class PillowShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const thing = 10;
    return Path()
      ..moveTo(rect.top, rect.top)
      ..quadraticBezierTo(
        rect.width / 2,
        rect.height / thing,
        rect.right,
        rect.top,
      )
      ..quadraticBezierTo(
        ((thing - 1) * rect.width) / thing,
        rect.height / 2,
        rect.right,
        rect.bottom,
      )
      ..quadraticBezierTo(
        rect.width / 2,
        ((thing - 1) * rect.height) / thing,
        rect.left,
        rect.bottom,
      )
      ..quadraticBezierTo(
        rect.width / thing,
        rect.height / 2,
        rect.left,
        rect.top,
      )
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return PillowShape();
  }
}
