import 'package:flutter_template/features/pokemon_details/domain/entities/pokemon.dart';

class GetPokemonByIdOutput {
  final Pokemon? pokemon;
  final String? error;

  const GetPokemonByIdOutput({
    this.error,
    this.pokemon,
  });
}
