import 'package:flutter_template/core/entities/summarized_pokemon.dart';

class GetSummarizedPokemonsOutput {
  final List<SummarizedPokemon>? pokemons;
  final String? error;

  const GetSummarizedPokemonsOutput({
    this.error,
    this.pokemons,
  });
}
