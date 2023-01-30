import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/features/landing_module/pages/landing_page.dart';
import 'package:sytex_coding_challenge/ioc/injector/injector.dart';

abstract class LandingModule {
  static const String LandingPageRoute = '/landing_page';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {LandingPageRoute: (context) => const LandingPage()};
  }

  static void registerDependencies(Injector injector) {}
}
