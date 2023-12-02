import 'package:flutter_template/features/pokemon_details/domain/entities/stats.dart';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final List<Stat> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.stats,
  });
}
