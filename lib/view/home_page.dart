import 'package:flutter/material.dart';
import 'package:pokedex_project/components/pokemon_cards.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:pokedex_project/view/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemon = PokemonRepository();

  final ScrollController _scrollController = ScrollController();

  void scrollTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4));

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: GestureDetector(onTap: scrollTop, child: const Text('Pokédex')),
      ),
      body: Column(children: [
        Expanded(
          child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8.0),
              itemCount: 905,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) {
                return PokemonCards(
                  future: pokemon.getPokemons(index + 1),
                  nextPage: DetailsPage(index: index + 1),
                );
              }),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
