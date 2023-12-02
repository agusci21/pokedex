import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/application/localizations/i18n.dart';
import 'package:flutter_template/features/pokemon_details/presentation/components/pokemon_details_layout/cubit/pokemon_details_layout_cubit.dart';

class PokemonDetailsLayout extends StatelessWidget {
  final PokemonDetailsLayoutCubit cubit;
  final String pokemonId;
  const PokemonDetailsLayout({
    required this.cubit,
    required this.pokemonId,
    super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonDetailsLayoutCubit, PokemonDetailsLayoutState>(
      bloc: cubit..getPokemon(pokemonId),
      listener: (context, state) {
        if (state is Failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                I18n.of(context).translate(state.error),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildByState(state),
        );
      },
    );
  }

  Widget _buildByState(PokemonDetailsLayoutState state) {
    if (state is Loaded) {
      return Text(state.pokemon.name);
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
