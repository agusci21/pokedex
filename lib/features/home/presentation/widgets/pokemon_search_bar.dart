import 'package:flutter/material.dart';
import 'package:flutter_template/application/localizations/i18n.dart';

class PokemonSearchBar extends StatelessWidget {
  final void Function(String value)? onChanged;
  const PokemonSearchBar({required this.onChanged, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: I18n.of(context).translate('pokemon_searchbar_hint'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
