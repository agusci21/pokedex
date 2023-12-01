import 'package:flutter/material.dart';
import 'package:flutter_template/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter_template/features/home/presentation/widgets/pokemon_card.dart';
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
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) => PokemonCard(),
        ),
      ),
    );
  }
}
