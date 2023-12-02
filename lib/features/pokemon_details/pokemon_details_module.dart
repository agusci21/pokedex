import 'package:flutter/material.dart';
import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/abstractions/i_injector.dart';
import 'package:flutter_template/features/pokemon_details/data/repositories/pokemon_repository.dart';
import 'package:flutter_template/features/pokemon_details/domain/repositories/i_pokemon_repository.dart';
import 'package:flutter_template/features/pokemon_details/presentation/components/pokemon_details_layout/cubit/pokemon_details_layout_cubit.dart';
import 'package:flutter_template/features/pokemon_details/presentation/pages/pokemon_details_page.dart';

abstract class PokemonDetailsModule {
  static const pokemonsDetails = 'details';
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        pokemonsDetails: (context) => const PokemonDetailsPage(),
      };

  static void registerDependencies(IInjector injector) {
    injector.registerFactory<IPokemonRepository>(
      () => PokemonRepository(
        httpHelper: injector.resolve<IHttpHelper>(),
        baseUrl: injector.resolveByName<String>('baseUrl'),
      ),
    );
    injector.registerFactory<PokemonDetailsLayoutCubit>(
      () => PokemonDetailsLayoutCubit(
        repository: injector.resolve<IPokemonRepository>(),
      ),
    );
  }
}
