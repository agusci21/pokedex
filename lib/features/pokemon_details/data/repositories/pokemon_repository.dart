import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/features/pokemon_details/data/mappers/pokemon_mapper.dart';
import 'package:flutter_template/features/pokemon_details/domain/inputs_outputs/get_pokemon_by_id/get_pokemon_by_id_input.dart';
import 'package:flutter_template/features/pokemon_details/domain/inputs_outputs/get_pokemon_by_id/get_pokemon_by_id_output.dart';
import 'package:flutter_template/features/pokemon_details/domain/repositories/i_pokemon_repository.dart';

class PokemonRepository implements IPokemonRepository {
  final IHttpHelper _httpHelper;
  final String _baseUrl;
  static const _endpoint = 'pokemon';
  const PokemonRepository({
    required IHttpHelper httpHelper,
    required String baseUrl,
  })  : _baseUrl = baseUrl,
        _httpHelper = httpHelper;

  @override
  Future<GetPokemonByIdOutput> getPokemonById(GetPokemonByIdInput input) async {
    final url = '$_baseUrl$_endpoint/${input.id}';
    try {
      final response = await _httpHelper.get(url);
      if (response.isOk) {
        return GetPokemonByIdOutput(
            pokemon: PokemonMapper.fromJson(response.data));
      }
      if (response.statusCode == 404) {
        return const GetPokemonByIdOutput(error: 'not_founded');
      }
      return const GetPokemonByIdOutput(error: 'generic_error_message');
    } catch (e) {
      return const GetPokemonByIdOutput(error: 'generic_error_message');
    }
  }
}
