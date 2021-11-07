import 'package:dormamu/src/state/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

/// Starts app.
///
/// Defines [ChangeNotifierProvider]s that manage state and starts app.
///
/// See also:
///
/// * [Dormamu]
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationState()),
      ],
      child: const Dormamu(),
    ),
  );
}
