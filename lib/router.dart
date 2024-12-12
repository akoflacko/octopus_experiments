import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_experiments/scoped_screen_guard.dart';

import 'routes.dart';

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final Octopus router;

  @override
  void initState() {
    final guard = ScopedScreenGuard(
      allowedScreens: {
        Routes.firstScreen.name,
        Routes.secondScreen.name,
      },
    );

    router = Octopus(
      routes: Routes.values,
      defaultRoute: Routes.home,
      guards: [
        guard,
      ],
      observers: [],
    );

    super.initState();
  }
}

class StateObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('didPop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    print('didRemove');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('didReplace');
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    print('didStartUserGesture');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    print('didStopUserGesture');
  }
}
