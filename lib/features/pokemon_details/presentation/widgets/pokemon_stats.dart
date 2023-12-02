import 'package:flutter/material.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          I18n.of(context).translate('base_stats'),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        ...stats.map((e) => StatPowerIndicator(stat: e)).toList()
      ],
    );
  }
}
