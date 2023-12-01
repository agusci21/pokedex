import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/entities/summarized_pokemon.dart';
import 'package:flutter_template/features/home/domain/inputs_outputs/get_summarized_pokemons/get_summarized_pokemons_input.dart';
import 'package:flutter_template/features/home/domain/repositories/i_summarized_pokemon_repository.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  final ISummarizedPokemonRepository _repository;
  HomeLayoutCubit({required ISummarizedPokemonRepository repository})
      : _repository = repository,
        super(Initial());

    Future<void> getInitialsPokemons () async {
      const input = GetSummarizedPokemonsInput(offset: 0);
      final output = await _repository.getAllPokemons(input);

      if(output.error == null){
        emit(Loaded(output.pokemons!));
        return;
      }

      emit(Failed(output.error!));
    }
}
