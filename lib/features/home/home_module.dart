import 'package:flutter/material.dart';
import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/abstractions/i_injector.dart';
import 'package:flutter_template/abstractions/i_navigation.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/features/pokemon_details/pokemon_details_module.dart';
import 'package:flutter_template/features/home/data/repositories/summarized_pokemon_repository.dart';
import 'package:flutter_template/features/home/domain/repositories/i_summarized_pokemon_repository.dart';
import 'package:flutter_template/features/home/presentation/components/home_layout/cubit/home_layout_cubit.dart';
import 'package:flutter_template/features/home/presentation/pages/home_page.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

abstract class HomeModule {
  static const homeRoute = '/';
  static final _navigationHelper = IocManager.instance.resolve<INavigation>();
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        homeRoute: (context) => const HomePage(),
      };

  static void registerDependencies(IInjector injector) {
    injector.registerFactory<ISummarizedPokemonRepository>(
      () => SummarizedPokemonRepository(
        baseUrl: injector.resolveByName<String>('baseUrl'),
        httpHelper: injector.resolve<IHttpHelper>(),
      ),
    );

    injector.registerFactory<HomeLayoutCubit>(
      () => HomeLayoutCubit(
          repository: injector.resolve<ISummarizedPokemonRepository>()),
    );
  }

  static Future<void> navigateToDetailedPokemonPage(
      BuildContext context, SummarizedPokemon selectedPokemon) async {
    await _navigationHelper.pushNamed(
      context,
      PokemonDetailsModule.pokemonsDetails,
      arguments: selectedPokemon,
    );
  }
}
