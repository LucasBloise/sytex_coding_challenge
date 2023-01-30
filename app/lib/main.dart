import 'package:flutter/material.dart';
import 'package:sytex_coding_challenge/features/form_module/form_module.dart';
import 'package:sytex_coding_challenge/features/landing_module/landing_module.dart';
import 'package:sytex_coding_challenge/helpers/implementations/navigation_helper_implementation.dart';
import 'package:sytex_coding_challenge/ioc/ioc_manager.dart';

void main() async {
  IocManager.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: LandingModule.LandingPageRoute,
        routes: _generateRoutes(),
        navigatorKey: NavigationHelperImplementation.navigatorKey);
  }

  static Map<String, WidgetBuilder> _generateRoutes() {
    return {
      ...LandingModule.generateRoutes(),
      ...FormModule.generateRoutes(),
    };
  }
}
