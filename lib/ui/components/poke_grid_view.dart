import 'package:flutter/material.dart';

import 'tabs/pokemon_selection_tab.dart';

class PokeGridView extends StatefulWidget {
  const PokeGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<PokeGridView> createState() => _PokeGridViewState();
}

class _PokeGridViewState extends State<PokeGridView> {
  @override
  Widget build(BuildContext context) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4));

    return GridView.builder(
      controller: widget.controller,
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: 905,
      gridDelegate: gridDelegate,
      itemBuilder: (context, index) => PokemonSelectionTab(
        id: index + 1,
      ),
    );
  }
}