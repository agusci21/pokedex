import 'package:flutter_template/features/pokemon_details/domain/entities/stats.dart';

abstract class StatMapper {
  static Stat fromJson(json) => Stat(
        baseStat: json['base_stat'],
        name: json['stat']['name'],
      );
}
