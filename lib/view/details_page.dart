import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_project/components/pokemon_stats.dart';
import 'package:pokedex_project/components/pokemon_types.dart';
import 'package:pokedex_project/components/rounded_button.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:string_capitalize/string_capitalize.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final pokemon = PokemonRepository();
    return Scaffold(
      body: FutureBuilder<PokemonModel>(
        future: pokemon.getPokemons(index),
        builder: (context, snapshot) {
          final snapData = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SafeArea(
                child: Stack(children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.purple.shade100,
                  ),
                  Image.asset(
                    'assets/img/pokeball_background.png',
                    opacity: const AlwaysStoppedAnimation(0.1),
                  ),
                  Column(
                    children: [
                      Image.network(
                        snapData!.image,
                        scale: 1.6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          snapData.name.capitalize(),
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      PokemonTypes(
                        futureType: pokemon.getType(index),
                        isRow: true,
                      ),
                    ],
                  ),
                  RoundedButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                  // IconButton(
                  //     onPressed: () => Navigator.pop(context),
                  //     icon: const Icon(
                  //       Icons.arrow_back_ios,
                  //       size: 35,
                  //     )),
                  Positioned(
                    top: 430.0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.55,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -2,
                              blurRadius: 4,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            )
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 30.0),
                              child: Text(
                                'Stats',
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            PokemonStats(index: index),
                          ]),
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
