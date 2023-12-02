import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  final List<SummarizedPokemon> pokemons;
  final bool isLoading;
  final void Function() shouldLoadMore;
  const PokemonGrid({
    required this.pokemons,
    required this.isLoading,
    required this.shouldLoadMore,
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
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1.5,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            if (!isLoading && pokemons.length - 9 <= index) {
              shouldLoadMore();
            }
            return PokemonCard(
              pokemon: pokemons[index],
            );
          },
        ),
      ),
    );
  }
}
