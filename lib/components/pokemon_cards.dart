import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonCards extends StatelessWidget {
  const PokemonCards({
    Key? key,
    required this.future,
    required this.futureType,
  }) : super(key: key);

  final Future<PokemonModel> future;
  final Future<List<PokeTypeModel>> futureType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonModel>(
      future: future,
      builder: (context, snapshot) {
        final snapData = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF80DDB2),
              ),
              child: Image.network(
                'https://media.istockphoto.com/id/1371944453/vector/blue-abstract-wave-background.jpg?s=612x612&w=0&k=20&c=uaCU_xpsKQLnbnvJH99iAi9uUqEAoS4jcyDwHXlLq5M=',
                fit: BoxFit.fill,
                opacity: const AlwaysStoppedAnimation(0.4),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Text('#${snapData!.id}'),
            ),
            Positioned(
              top: 30.0,
              left: 10.0,
              child: SizedBox(
                width: 110,
                child: Text(
                  snapData.name.capitalize(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              right: 2,
              child: SizedBox(
                width: 100,
                child: Image.network(
                  snapData.image,
                ),
              ),
            ),
            FutureBuilder<List<PokeTypeModel>>(
              future: futureType,
              builder: (context, snapshot) {
                final snapData = snapshot.data;
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Positioned(
                  top: 55.0,
                  left: 10.0,
                  child: SizedBox(
                    width: 75,
                    height: 60,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) => Column(
                        children: snapData!
                            .map<Widget>(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 65,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          e.name.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        );
      },
    );
  }
}
