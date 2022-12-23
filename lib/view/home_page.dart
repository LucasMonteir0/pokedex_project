import 'package:flutter/material.dart';
import 'package:pokedex_project/components/pokemon_cards.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = PokemonRepository();
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: GridView.builder(
          // padding: const EdgeInsets.all(8.0),
          itemCount: 905,
          gridDelegate: gridDelegate,
          itemBuilder: (context, index) {
            return PokemonCards(
              futureType: pokemon.getType(index + 1),
              future: pokemon.getPokemons(index + 1),
            );
          }),
    );
  }
}
