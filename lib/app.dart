import 'package:dormamu/src/navigation.dart';
import 'package:dormamu/src/state/navigation_state.dart';
import 'package:dormamu/src/utils/destination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The main widget of the Dormamu app.
///
/// This widget defines the app and cont
class Dormamu extends StatelessWidget {
  const Dormamu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Consumer<NavigationState>(builder: (_, navigationState, __) {
          return _buildBody(context, navigationState.currentDestination.widget);
        }),
        bottomNavigationBar: buildNavigationBar(context),
      ),
    );
  }

  ///Determines if a navigation element is needed and displays the main content
  ///of the app.
  ///
  /// This function uses [LayoutBuilder] to determine if a navigation element is
  /// needed. If a navigation element is needed, it is created along with the
  /// main body of the app. If a navigation element is not needed, only the main
  /// body of the app is created. No navigation element is shown if the device
  /// screen size is less than 600 logical pixels, in this case a
  /// [DormamuNavigationBar] is used. If the device screen width is smaller than
  /// 1240 logical pixels, the [DormamuNavigationRail] is shown. If the device
  /// screen width is greater than 1240 logical pixels, a
  /// [DormamuNavigationDrawer] is shown.
  ///
  /// See also:
  /// * [DormamuNavigationBar] - The navigation element for mobile.
  /// * [DormamuNavigationRail] - The navigation element for small web displays.
  /// * [DormamuNavigationDrawer] - The navigation element for large web displays.
  /// * [LayoutBuilder] - Used to determine the width of the device.
  static Widget _buildBody(BuildContext context, Widget body) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return body;
        } else if (constraints.maxWidth < 1240) {
          return DormamuNavigationRail(child: body);
        } else {
          return DormamuNavigationDrawer(child: body);
        }
      },
    );
  }
}
