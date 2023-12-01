import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/features/home/data/mappers/summarized_pokemon_mapper.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_output.dart';
import 'package:flutter_template/features/home/domain/repositories/i_summarized_pokemon_repository.dart';

class SummarizedPokemonRepository implements ISummarizedPokemonRepository {
  final IHttpHelper _httpHelper;
  final String _baseUrl;
  static const _endpoint = 'pokemon';
  SummarizedPokemonRepository({
    required IHttpHelper httpHelper,
    required String baseUrl,
  })  : _baseUrl = baseUrl,
        _httpHelper = httpHelper;

  @override
  Future<GetSummarizedPokemonsOutput> getAllPokemons(GetSummarizedPokemonsInput input) async {
    String url = '$_baseUrl$_endpoint?limit=${input.limit}';
    if (input.offset != null) {
      url += '&offset=${input.offset}';
    }
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        final pokemons = response.data['results'] as List;
        return GetSummarizedPokemonsOutput(
          pokemons: List.generate(
            pokemons.length,
            (index) => SummarizedPokemonMapper.fromJson(
              pokemons[index],
            ),
          ),
        );
      }
      return const GetSummarizedPokemonsOutput(error: 'generic_error_message');
    } catch (e) {
      return const GetSummarizedPokemonsOutput(error: 'generic_error_message');
    }
  }
}
