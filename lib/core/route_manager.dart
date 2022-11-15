import 'package:flutter/material.dart';

import '../ui/first_screen.dart';
import '../ui/home_screen.dart';
import '../ui/second_screen.dart';

class Routes {
  static const String homeScreen = "/";
  static const String firstScreen = "/fisrt";
  static const String secondScreen = "/second";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.firstScreen:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case Routes.secondScreen:
        return MaterialPageRoute(builder: (_) => const SecondScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("UnDefined"),
              ),
              body: const Center(child: Text("UnDefined Screen")),
            ));
  }
}
