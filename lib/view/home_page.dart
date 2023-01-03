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

  @override
  Widget build(BuildContext context) {
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4));

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Pokédex'),
      ),
      body: Column(children: [
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.only(top: 8.0),
              itemCount: 905,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) {
                return PokemonCards(
                  futureType: pokemon.getType(index + 1),
                  future: pokemon.getPokemons(index + 1),
                  nextPage: DetailsPage(index: index + 1),
                );
              }),
        ),
      ]),
    );
  }
}
