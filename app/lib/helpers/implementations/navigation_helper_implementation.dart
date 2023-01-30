import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/navigation_helper.dart';

class NavigationHelperImplementation implements NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void pop<T extends Object>(BuildContext context) {
    return navigatorKey.currentState?.pop();
  }

  @override
  Future<dynamic>? push<T extends Object>(String route, BuildContext context, {args}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: args);
  }

  @override
  Future<dynamic>? pushReplace<T extends Object>(String route, BuildContext context, {args}) {
    return navigatorKey.currentState?.pushReplacementNamed(route);
  }
}
