import 'package:flutter_template/features/pokemon_details/domain/inputs_outputs/get_pokemon_by_id/get_pokemon_by_id_input.dart';
import 'package:flutter_template/features/pokemon_details/domain/inputs_outputs/get_pokemon_by_id/get_pokemon_by_id_output.dart';

abstract class IPokemonRepository {
  Future<GetPokemonByIdOutput> getPokemonById(GetPokemonByIdInput input);
}
