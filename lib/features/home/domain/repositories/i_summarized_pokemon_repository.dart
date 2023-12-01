import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_output.dart';

abstract class ISummarizedPokemonRepository {
  Future<GetSummarizedPokemonsOutput> getAllPokemons(GetSummarizedPokemonsInput input);
}
