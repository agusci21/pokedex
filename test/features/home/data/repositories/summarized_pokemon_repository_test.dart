

import 'package:flutter_template/abstractions/i_http_helper.dart';
import 'package:flutter_template/features/home/data/repositories/summarized_pokemon_repository.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../pokemon_details/data/repositories/common/http_helper_mock.mocks.dart';

void main() async {
  final MockIHttpHelper mockHttpHelper =  MockIHttpHelper();
  final SummarizedPokemonRepository repository = SummarizedPokemonRepository(baseUrl: 'https://test_url', httpHelper: mockHttpHelper);
  group('Will test SummarizedPokemon repository at getting data ', () {
    const input = GetSummarizedPokemonsInput();
    test('Will test a successful petition, should answer an output with data',
        () async {
      final mockData = {
    "count": 1292,
    "next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
    "previous": null,
    "results": [
        {
            "name": "bulbasaur",
            "url": "https://pokeapi.co/api/v2/pokemon/1/"
        },
        {
            "name": "ivysaur",
            "url": "https://pokeapi.co/api/v2/pokemon/2/"
        },
        {
            "name": "venusaur",
            "url": "https://pokeapi.co/api/v2/pokemon/3/"
        },
        {
            "name": "charmander",
            "url": "https://pokeapi.co/api/v2/pokemon/4/"
        },
        {
            "name": "charmeleon",
            "url": "https://pokeapi.co/api/v2/pokemon/5/"
        },
        {
            "name": "charizard",
            "url": "https://pokeapi.co/api/v2/pokemon/6/"
        },
        {
            "name": "squirtle",
            "url": "https://pokeapi.co/api/v2/pokemon/7/"
        },
        {
            "name": "wartortle",
            "url": "https://pokeapi.co/api/v2/pokemon/8/"
        },
        {
            "name": "blastoise",
            "url": "https://pokeapi.co/api/v2/pokemon/9/"
        },
        {
            "name": "caterpie",
            "url": "https://pokeapi.co/api/v2/pokemon/10/"
        },
        {
            "name": "metapod",
            "url": "https://pokeapi.co/api/v2/pokemon/11/"
        },
        {
            "name": "butterfree",
            "url": "https://pokeapi.co/api/v2/pokemon/12/"
        },
        {
            "name": "weedle",
            "url": "https://pokeapi.co/api/v2/pokemon/13/"
        },
        {
            "name": "kakuna",
            "url": "https://pokeapi.co/api/v2/pokemon/14/"
        },
        {
            "name": "beedrill",
            "url": "https://pokeapi.co/api/v2/pokemon/15/"
        },
        {
            "name": "pidgey",
            "url": "https://pokeapi.co/api/v2/pokemon/16/"
        },
        {
            "name": "pidgeotto",
            "url": "https://pokeapi.co/api/v2/pokemon/17/"
        },
        {
            "name": "pidgeot",
            "url": "https://pokeapi.co/api/v2/pokemon/18/"
        },
        {
            "name": "rattata",
            "url": "https://pokeapi.co/api/v2/pokemon/19/"
        },
        {
            "name": "raticate",
            "url": "https://pokeapi.co/api/v2/pokemon/20/"
        }
    ]
};
      final mockResponse = HttpResponse(mockData, 200);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getAllPokemons(input);
      expect(output.pokemons, isNotEmpty);
      expect(output.error, isNull);
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and no generic error',
        () async {
      final mockResponse = HttpResponse({}, 400);
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => mockResponse);
      final output = await repository.getAllPokemons(input);
      expect(output.pokemons, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
    test(
        'Will test a failed petition, should answer an output with no data and generic error caused by an internal server error',
        () async {
      when(mockHttpHelper.get(any))
          .thenAnswer((realInvocation) async => throw Exception());
      final output = await repository.getAllPokemons(input);
      expect(output.pokemons, isNull);
      expect(output.error, isNotNull);
      expect(output.error, 'generic_error_message');
      verify(mockHttpHelper.get(any)).called(1);
    });
  });
}