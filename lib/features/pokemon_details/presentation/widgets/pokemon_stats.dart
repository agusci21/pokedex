import 'package:flutter/material.dart';
import 'package:flutter_template/features/pokemon_details/domain/entities/stats.dart';
import 'package:flutter_template/features/pokemon_details/presentation/widgets/stat_power_indicator.dart';

class PokemonStats extends StatelessWidget {
  final List<Stat> stats;
  const PokemonStats({
    required this.stats,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: stats.map((e) => StatPowerIndicator(stat: e)).toList(),
        ),
      ),
    );
  }
}
