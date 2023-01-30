import 'package:flutter/material.dart';

abstract class NavigationHelper {
  Future<dynamic>? push<T extends Object>(String route, BuildContext context, {dynamic args});

  Future<dynamic>? pushReplace<T extends Object>(String route, BuildContext context, {dynamic args});

  void pop<T extends Object>(BuildContext context);
}
