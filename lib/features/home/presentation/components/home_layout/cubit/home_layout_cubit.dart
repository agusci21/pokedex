import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/core/extensions/string_helpers.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:flutter_template/features/home/domain/repositories/i_summarized_pokemon_repository.dart';
import 'package:flutter_template/features/home/presentation/widgets/order_button.dart';

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

  void orderBy(OrderOption option) {
    if (state is! Loaded) {
      return;
    }

    final previousState = state as Loaded;
    final orderList = previousState.pokemons;
    orderList.sort(
      (a, b) {
        return option == OrderOption.orderByName
            ? _compareByName(a, b)
            : _compareById(a, b);
      },
    );
    emit(
      Loaded(
        pokemons: orderList,
        totalPokemons: previousState.totalPokemons,
      ),
    );
  }

  int _compareByName(SummarizedPokemon a, SummarizedPokemon b) {
    return a.name.compareTo(b.name);
  }

  int _compareById(SummarizedPokemon a, SummarizedPokemon b) {
    final int firstId = int.parse(a.url.getIdFromUrl('pokemon')!);
    final int secondId = int.parse(b.url.getIdFromUrl('pokemon')!);
    if (firstId > secondId) {
      return 1;
    }
    if (secondId > firstId) {
      return -1;
    }
    return 0;
  }
}
