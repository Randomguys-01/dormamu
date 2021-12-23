import 'package:flutter/material.dart';

/// [ShapeBorder] configured to look like the portrait of a bed from the left
/// side view.
class BedShape extends RoundedRectangleBorder {
  /// Default constructor
  const BedShape()
      : super(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        );
}
