import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:pokedex_project/ui/blocs/states.dart';

class GetPokemonBloc extends Cubit<BaseState> {
  final PokemonRepository _repository;
  final int id;

  GetPokemonBloc(this._repository, this.id) : super(EmptyState());

  void call() async {
    emit(LoadingState());
    try {
      final result = await _repository.getPokemons(id);
      emit(SuccessState<PokeModel>(result));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}