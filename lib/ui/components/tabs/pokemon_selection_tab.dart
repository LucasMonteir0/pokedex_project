import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:pokedex_project/ui/blocs/pokemon_bloc.dart';
import 'package:pokedex_project/ui/blocs/states.dart';
import 'package:pokedex_project/ui/components/pokemon_widgets/pokemon_cards.dart';

class PokemonSelectionTab extends StatefulWidget {
  const PokemonSelectionTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<PokemonSelectionTab> createState() => _PokemonSelectionTabState();
}

class _PokemonSelectionTabState extends State<PokemonSelectionTab> {
  late PokemonRepository _repository;
  late GetPokemonBloc bloc;

  @override
  void initState() {
    super.initState();
    _repository = PokemonRepository();
    bloc = GetPokemonBloc(_repository, widget.id);
    bloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPokemonBloc, BaseState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(
              child: Text(state.message!),
            );
          }
          if (state is SuccessState) {
            return PokemonCard(
              data: state.data,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
