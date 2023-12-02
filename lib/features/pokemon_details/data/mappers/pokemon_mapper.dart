import 'package:flutter_template/features/pokemon_details/data/mappers/stat_mapper.dart';
import 'package:flutter_template/features/pokemon_details/domain/entities/pokemon.dart';

abstract class PokemonMapper {
  static Pokemon fromJson(json) {
    final types = (json['types'] as List)
        .map((e) => e['type']['name'].toString())
        .toList();
    final stats = (json['stats'] as List)
        .map(
          (e) => StatMapper.fromJson(e),
        )
        .toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      types: types,
      stats: stats,
    );
  }
}
