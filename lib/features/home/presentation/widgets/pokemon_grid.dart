import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  final List<SummarizedPokemon> pokemons;
  const PokemonGrid({
    required this.pokemons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) => PokemonCard(
            pokemon: pokemons[index],
          ),
        ),
      ),
    );
  }
}
