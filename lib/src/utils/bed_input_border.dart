import 'dart:math' show pi;

import 'package:flutter/material.dart';

/// Draws a line from the [BorderSide.topLeft], around any [BorderRadius], and
/// down to the [BorderSide.bottomRight] and defines the container's shape.
///
/// See [UnderlineInputBorder].
/// TODO: let's make this a blanket; Maybe ad a purple shadow beneath the line
class BedInputBorder extends UnderlineInputBorder {//todo: maybe blanket border
  /// Default constructor
  const BedInputBorder({
    BorderSide borderSide = const BorderSide(),
    BorderRadius borderRadius =
        const BorderRadius.only(topRight: Radius.circular(25)),
  }) : super(
          borderSide: borderSide,
          borderRadius: borderRadius,
        );

  /// Paints the border.
  ///
  /// Draws 3 objects.
  ///
  /// * Horizontal line from [BorderSide.topLeft] towards [BorderSide.topRight]
  /// stopping before any [BorderRadius] begins.
  /// * Arc tracing the [BorderRadius].
  /// * Vertical line from the end of the [BorderRadius] to [BorderSide.bottomRight].
  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final thing = Offset(rect.topRight.dx - 25, rect.topRight.dy);
    final thingy = Offset(rect.topRight.dx, rect.topRight.dy + 25);

    canvas.drawLine(rect.topLeft, thing, borderSide.toPaint());
    canvas.drawLine(thingy, rect.bottomRight, borderSide.toPaint());
    canvas.drawArc(
      Rect.fromPoints(Offset(rect.width - 50, 0), Offset(rect.width, 50)),
      -pi / 2,
      pi / 2,
      false,
      borderSide.toPaint(),
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is BedInputBorder) {
      return BedInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is BedInputBorder) {
      return BedInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }

    return super.lerpTo(b, t);
  }
}
