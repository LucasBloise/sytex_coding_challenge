import 'package:sytex_coding_challenge/ioc/injector/injector.dart';
import 'package:sytex_coding_challenge/ioc/injector/injector_implementation.dart';

abstract class IocManager {
  static Injector? _injector;

  static void register() {
    _injector = Injector.register(InjectorImplementation());
  }

  static get instance => _injector;
}
