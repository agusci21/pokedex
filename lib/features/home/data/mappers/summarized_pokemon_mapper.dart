import 'package:flutter_template/core/entities/summarized_pokemon.dart';

abstract class SummarizedPokemonMapper {
  static SummarizedPokemon fromJson(json) {
    return SummarizedPokemon(
      name: json['name'],
    );
  }
}
