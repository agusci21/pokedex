import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/core/extensions/string_helpers.dart';
import 'package:flutter_template/features/pokemon_details/presentation/components/pokemon_details_layout/cubit/pokemon_details_layout_cubit.dart';
import 'package:flutter_template/features/pokemon_details/presentation/components/pokemon_details_layout/presentation/pokemon_details_layout.dart';
import 'package:flutter_template/features/pokemon_details/presentation/widgets/pokemon_details_appbar.dart';
import 'package:flutter_template/infrastructure/ioc_manager.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokemon =
        ModalRoute.of(context)!.settings.arguments as SummarizedPokemon;
    return Scaffold(
      appBar: PokemonDetailsAppbar(
        pokemonName: pokemon.name,
      ),
      body:  PokemonDetailsLayout(
        pokemonId: pokemon.url.getIdFromUrl('pokemon')!,
        cubit: IocManager.instance.resolve<PokemonDetailsLayoutCubit>(),
      ),
    );
  }
}
