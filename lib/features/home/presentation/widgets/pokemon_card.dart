import 'package:flutter/material.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';

class PokemonCard extends StatelessWidget {
  final SummarizedPokemon pokemon;
  const PokemonCard({
    required this.pokemon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade200, blurRadius: 3, offset: const Offset(0, 5)),
          ],
        ),
        child: Text('#${1} ${pokemon.name}'));
  }
}
