part of 'pokemon_details_layout_cubit.dart';

sealed class PokemonDetailsLayoutState {}

final class Initial extends PokemonDetailsLayoutState {}

final class Loading extends PokemonDetailsLayoutState {}

final class Loaded extends PokemonDetailsLayoutState {
  final Pokemon pokemon;
  Loaded(this.pokemon);
}

final class Failed extends PokemonDetailsLayoutState {
  final String error;
  Failed(this.error);
}
