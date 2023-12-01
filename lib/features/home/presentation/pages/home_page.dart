import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: Column(
        children: [
          PokemonSearchBar(
            onChanged: (value) {
              //TODO create cubit and search
            },
          ),
          const _PokemonGrid(),
        ],
      ),
    );
  }
}

class _PokemonGrid extends StatelessWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) => Text(index.toString()),
        ),
      ),
    );
  }
}
