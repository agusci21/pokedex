import 'package:flutter_template/abstractions/i_navigation.dart';
import 'package:flutter_template/features/home/home_module.dart';
import 'package:flutter_template/features/pokemon_details/pokemon_details_module.dart';
import 'package:flutter_template/implementations/navigation.dart';
import 'package:flutter_template/infrastructure/environments_confi.dart';
import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/implementations/http_helper.dart';

import '../abstractions/i_injector.dart';
import '../implementations/injector.dart';

abstract class IocManager {
  static late IInjector _injector;

  static void register() {
    _injector = IInjector.register(Injector());
    _registerCommonDependencies(_injector);
    HomeModule.registerDependencies(_injector);
    PokemonDetailsModule.registerDependencies(_injector);
  }

  static void _registerCommonDependencies(IInjector injector) {
    injector.registerFactoryByName<String>(
      () => EnvironmentConfig.baseUrl,
      'baseUrl',
    );
    injector.registerFactory<IHttpHelper>(
      () => HttpHelper(),
    );
    injector.registerFactory<INavigation>(() => Navigation());
  }

  static IInjector get instance => _injector;
}
