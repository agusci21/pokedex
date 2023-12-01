part of 'home_layout_cubit.dart';

sealed class HomeLayoutState {}

final class Initial extends HomeLayoutState {}

final class Loading extends HomeLayoutState {}

final class Loaded extends HomeLayoutState {
  final List<SummarizedPokemon> pokemons;
  final List<SummarizedPokemon> totalPokemons;
  final bool isLoadingMore;
  Loaded({
    required this.pokemons,
    required this.totalPokemons,
    this.isLoadingMore = false,
  });
}

final class Failed extends HomeLayoutState {
  final String error;
  Failed(this.error);
}
