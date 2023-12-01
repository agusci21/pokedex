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
      emit(Loaded(pokemons: output.pokemons!));
      _offset += limit;
      return;
    }
    emit(Failed(output.error!));
  }

  Future<void> loadMore() async {
    if (state is! Loaded) {
      return;
    }
    final previousState = state as Loaded;
    emit(Loaded(pokemons: previousState.pokemons, isLoadingMore: true));
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
        ),
      );
      _offset += limit;
      return;
    }
    emit(Failed(output.error!));
    emit(previousState);
  }
}
