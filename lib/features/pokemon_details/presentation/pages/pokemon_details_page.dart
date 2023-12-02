import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon =
        ModalRoute.of(context)!.settings.arguments as SummarizedPokemon;
    return Scaffold(
      body: Center(
        child: Text(pokemon.name),
      ),
    );
  }
}
