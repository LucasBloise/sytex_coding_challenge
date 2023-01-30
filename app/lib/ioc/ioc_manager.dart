import 'package:sytex_coding_challenge/features/form_module/form_module.dart';
import 'package:sytex_coding_challenge/features/landing_module/landing_module.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/connection_helper.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/event_bus.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/http_helper.dart';
import 'package:sytex_coding_challenge/helpers/abstractions/navigation_helper.dart';
import 'package:sytex_coding_challenge/helpers/implementations/connection_helper_implementation.dart';
import 'package:sytex_coding_challenge/helpers/implementations/event_bus_implementation.dart';
import 'package:sytex_coding_challenge/helpers/implementations/http_helper_implementation.dart';
import 'package:sytex_coding_challenge/helpers/implementations/navigation_helper_implementation.dart';
import 'package:sytex_coding_challenge/ioc/injector/injector.dart';
import 'package:sytex_coding_challenge/ioc/injector/injector_implementation.dart';

abstract class IocManager {
  static Injector? _injector;

  static void register() {
    _injector = Injector.register(InjectorImplementation());
    _registerCommonDependencies(_injector!);
    LandingModule.registerDependencies(_injector!);
    FormModule.registerDependencies(_injector!);
  }

  static void _registerCommonDependencies(Injector injector) {
    injector
      ..registerLazySingleton<HttpHelper>(
        HttpHelperImplementation.new,
      )
      ..registerLazySingleton<NavigationHelper>(
        NavigationHelperImplementation.new,
      )
      ..registerLazySingleton<ServiceBus>(
        ServiceBusImplementation.new,
      )
      ..registerLazySingleton<ConnectionHelper>(
        ConnectionHelperImplementation.new,
      );
  }

  static Injector? get instance => _injector;
}
