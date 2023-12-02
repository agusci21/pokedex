import 'package:flutter/material.dart';
import 'package:flutter_template/abstractions/i_injector.dart';
import 'package:flutter_template/features/pokemon_details/presentation/pages/pokemon_details_page.dart';

abstract class PokemonDetailsModule {
  static const pokemonsDetails = 'details';
  static Map<String, Widget Function(BuildContext)> generateRoutes() => {
        pokemonsDetails: (context) => const PokemonDetailsPage(),
      };

  static void registerDependencies(IInjector injector) {}
}
