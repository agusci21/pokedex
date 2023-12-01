import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:flutter_template/features/home/domain/repositories/i_summarized_pokemon_repository.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  final ISummarizedPokemonRepository _repository;
  int _offset = 0;
  HomeLayoutCubit({required ISummarizedPokemonRepository repository})
      : _repository = repository,
        super(Initial());

  Future<void> getInitialsPokemons() async {
    _offset = 0;
    const limit = 60;
    final input = GetSummarizedPokemonsInput(offset: _offset, limit: limit);
    final output = await _repository.getAllPokemons(input);

    if (output.error == null) {
      emit(
        Loaded(pokemons: output.pokemons!, totalPokemons: output.pokemons!),
      );
      _offset += limit;
      return;
    }
    emit(Failed(output.error!));
  }

  void onSearch(String searchField) {
    if (state is! Loaded) {
      return;
    }
    final previousState = state as Loaded;

    final List<SummarizedPokemon> newList = [];
    for (final element in previousState.totalPokemons) {
      if (element.name.contains(searchField.toLowerCase())) {
        newList.add(element);
      }
    }
    emit(
      Loaded(pokemons: newList, totalPokemons: previousState.totalPokemons),
    );
  }

  Future<void> loadMore() async {
    if (state is! Loaded) {
      return;
    }
    final previousState = state as Loaded;
    emit(
      Loaded(
        pokemons: previousState.pokemons,
        isLoadingMore: true,
        totalPokemons: previousState.totalPokemons,
      ),
    );
    const limit = 60;
    final input = GetSummarizedPokemonsInput(offset: _offset, limit: limit);
    final output = await _repository.getAllPokemons(input);

    if (output.error == null) {
      emit(
        Loaded(
          pokemons: [
            ...previousState.pokemons,
            ...output.pokemons!,
          ],
          totalPokemons: [
            ...previousState.totalPokemons,
            ...output.pokemons!,
          ],
        ),
      );
      _offset += limit;
      return;
    }
    emit(Failed(output.error!));
    emit(previousState);
  }
}
