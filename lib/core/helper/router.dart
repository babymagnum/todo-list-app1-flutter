import 'package:dribbble_clone/view/container/container_view.dart';
import 'package:dribbble_clone/view/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case ContainerView.routeName:
        return MaterialPageRoute(builder: (_) => ContainerView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
