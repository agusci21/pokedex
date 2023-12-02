import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/features/pokemon_details/domain/entities/stats.dart';

class StatPowerIndicator extends StatelessWidget {
  final Stat stat;
  const StatPowerIndicator({
    required this.stat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(I18n.of(context).translate(stat.name)),
          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.grey),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: min(stat.baseStat / 100, 1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: _getColor(stat.name),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(String statName) {
    final mapOfColors = {
      'hp': Colors.green.shade600,
      'attack': Colors.red,
      'defense': Colors.blue,
      'special-attack': Colors.orange.shade700,
      'special-defense': Colors.pink.shade800,
      'speed': Colors.yellow.shade700
    };
    return mapOfColors[statName] ?? Colors.red;
  }
}
