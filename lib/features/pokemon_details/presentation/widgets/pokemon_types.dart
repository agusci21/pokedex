import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/core/extensions/string_helpers.dart';

class PokemonTypes extends StatelessWidget {
  final List<String> types;
  const PokemonTypes({
    required this.types,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            I18n.of(context).translate('pokemon_types'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Wrap(
            children: types.map(
              (e) {
                final backGroundColor = _getRandomColor();
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: _getRandomColor(),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    e.capitalizeFirst(),
                    style: TextStyle(
                      color: _getContrastColor(backGroundColor),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }

  Color _getRandomColor() {
    return Color.fromRGBO(
      Random().nextInt(200) + 28,
      Random().nextInt(200) + 28,
      Random().nextInt(200) + 28,
      1,
    );
  }

  Color _getContrastColor(Color backgroundColor) {
    double luminosity = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;

    return luminosity > 0.65 ? Colors.black : Colors.white;
  }
}
