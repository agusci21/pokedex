part of 'home_layout_cubit.dart';

sealed class HomeLayoutState {}

final class Initial extends HomeLayoutState {}
final class Loading extends HomeLayoutState {}
final class Loaded extends HomeLayoutState {
  final List<SummarizedPokemon> pokemons;
  Loaded(this.pokemons);
}
final class Failed extends HomeLayoutState {
  final String error;
  Failed(this.error);
}
