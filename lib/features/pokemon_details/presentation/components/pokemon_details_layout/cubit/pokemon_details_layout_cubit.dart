import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/pokemon_details/domain/entities/pokemon.dart';
import 'package:flutter_template/features/pokemon_details/domain/inputs_outputs/get_pokemon_by_id/get_pokemon_by_id_input.dart';
import 'package:flutter_template/features/pokemon_details/domain/repositories/i_pokemon_repository.dart';

part 'pokemon_details_layout_state.dart';

class PokemonDetailsLayoutCubit extends Cubit<PokemonDetailsLayoutState> {
  final IPokemonRepository _repository;
  PokemonDetailsLayoutCubit({required IPokemonRepository repository})
      : _repository = repository,
        super(Initial());

  Future<void> getPokemon(final String id) async {
    final input = GetPokemonByIdInput(id: id);
    final output = await _repository.getPokemonById(input);
    if (output.error == null) {
      emit(Loaded(output.pokemon!));
      return;
    }
    emit(Failed(output.error!));
  }
}
