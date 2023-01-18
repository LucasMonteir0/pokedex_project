import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:pokedex_project/ui/blocs/pokemon_bloc.dart';
import 'package:pokedex_project/ui/blocs/states.dart';
import 'package:pokedex_project/ui/components/pokemon_widgets/pokemon_cards.dart';

class PokemonSelectionTab extends StatefulWidget {
  const PokemonSelectionTab({
    Key? key, required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<PokemonSelectionTab> createState() => _PokemonSelectionTabState();
}

class _PokemonSelectionTabState extends State<PokemonSelectionTab> {
  late PokemonRepository _repository;
  late GetPokemonBloc bloc;

  @override
  void initState() {
    _repository = PokemonRepository();
    bloc = GetPokemonBloc(_repository);
    bloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4));

    return BlocBuilder<GetPokemonBloc, BaseState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ErrorState) {
            return Center(
              child: Text(state.message!),
            );
          }
          if (state is SuccessState) {
            return GridView.builder(
      controller: widget.controller,
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: 905,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) => PokemonCard( 
          data: state.data[index],
          ),
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