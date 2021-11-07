import 'package:dormamu/src/state/navigation_state.dart';
import 'package:dormamu/src/utils/destination.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart' as theme;

/// Determines if a [DormamuNavigationBar] is needed and builds it if necessary.
///
/// This function uses [LayoutBuilder] to determine if a [NavigationBar] is the
/// correct navigation element for the current device. If it is the correct
/// element, it creates the element, if it is not the correct element, it
/// creates an empty [SizedBox]. The [DormamuNavigationBar] is shown for devices
/// with a screen width smaller than 600 logical pixels. This number was
/// selected based on Material Design guidelines.
///
/// See also:
///
/// * [DormamuNavigationBar] - The navigation element that could be created.
/// * [LayoutBuilder] - Used to determine if the width of the device.
Widget? buildNavigationBar(BuildContext context) {
  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
      return const DormamuBottomNavigationBar();
    } else {
      return const SizedBox(width: 0, height: 0);
    }
  });
}

/// Instance of [BottomNavigationBar] is the main navigation element for mobile.
///
/// This [BottomNavigationBar] defines the main screens for [Dormamu]. These
/// screens are defined in [Destination]. The selected screen is controlled
/// through [NavigationState]. When a new item is selected, [NavigationState] is
/// called and updated.
///
/// See also:
///
/// * [BottomNavigationBar] - This widget implements a [BottomNavigationBar].
/// * [Destination] - Defines and controls the screens accessible through this
/// * [NavigationState] - Contains callback for item's onTap, controls which
/// screen is currently selected.
class DormamuBottomNavigationBar extends StatelessWidget {
  const DormamuBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Rebuilds every time there is a change in navigation state.
    return Consumer<NavigationState>(builder: (_, navigationData, __) {
      return BottomNavigationBar(
        currentIndex: navigationData.currentDestination.index,
        //Creates an item for every Destination.
        items: <BottomNavigationBarItem>[
          for (var destination in Destination.values)
            BottomNavigationBarItem(
              icon: Icon(destination.icon),
              label: destination.name,
            ),
        ],
        //Calls NavigationState handler on tap (click).
        onTap: navigationData.onDestinationSelected,
      );
    });
  }
}

/// Instance of [NavigationRail] is the main navigation element for tablet and
/// small-screen displays for the web.
///
/// This [NavigationRail] defines the main screens for [Dormamu]. These
/// screens are defined in [Destination]. The selected screen is controlled
/// through [NavigationState]. When a new item is selected, [NavigationState] is
/// called and updated.
///
/// This widget is a part of the body of the app and contains a [child] widget.
/// The [child] is placed inside an [Expanded] to fill the remaining screen
/// space after the [DormamuNavigationRail] is drawn. The child should contain
/// the content of the current [Destination].
///
/// See also:
///
/// * [NavigationRail] - This widget implements a [NavigationRail].
/// * [Destination] - Defines and controls the screens accessible through this
/// * [NavigationState] - Contains callback for item's onTap, controls which
/// screen is currently selected.
class DormamuNavigationRail extends StatelessWidget {
  const DormamuNavigationRail({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<NavigationState>(builder: (_, navigationData, __) {
          return NavigationRail(
            labelType: NavigationRailLabelType.all,
            selectedIndex: navigationData.currentDestination.index,
            destinations: <NavigationRailDestination>[
              for (var destination in Destination.values)
                NavigationRailDestination(
                  icon: Icon(destination.icon),
                  label: Text(destination.name),
                ),
            ],
            onDestinationSelected: navigationData.onDestinationSelected,
          );
        }),
        if (child != null) Expanded(child: child!)
      ],
    );
  }
}

/// Instance of [Drawer] is the main navigation element for the web.
///
/// This [Drawer] defines the main screens for [Dormamu]. These
/// screens are defined in [Destination]. The selected screen is controlled
/// through [NavigationState]. When a new item is selected, [NavigationState] is
/// called and updated.
///
/// This widget is a part of the body of the app and contains a [child] widget.
/// The [child] is placed inside an [Expanded] to fill the remaining screen
/// space after the [DormamuNavigationDrawer] is drawn. The child should contain
/// the content of the current [Destination].
///
/// See also:
///
/// * [Drawer] - This widget implements a [Drawer].
/// * [Destination] - Defines and controls the screens accessible through this
/// * [NavigationState] - Contains callback for item's onTap, controls which
/// screen is currently selected.
class DormamuNavigationDrawer extends StatelessWidget {
  const DormamuNavigationDrawer({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<NavigationState>(builder: (_, navigationData, __) {
          return Drawer(
            child: Container(
              color: theme.primaryColor,
              child: ListView(
                children: <Widget>[
                  for (var destination in Destination.values)
                    ListTile(
                      leading: Icon(
                        destination.icon,
                        color: navigationData.currentDestination == destination
                            ? theme.selectedItemColor
                            : theme.unselectedItemColor,
                      ),
                      title: Text(
                        destination.name,
                        style: TextStyle(
                          color:
                              navigationData.currentDestination == destination
                                  ? theme.selectedItemColor
                                  : theme.unselectedItemColor,
                        ),
                      ),
                      selected:
                          navigationData.currentDestination == destination,
                      onTap: () =>
                          navigationData.currentDestination = destination,
                    ),
                ],
              ),
            ),
          );
        }),
        if (child != null) Expanded(child: child!)
      ],
    );
  }
}
