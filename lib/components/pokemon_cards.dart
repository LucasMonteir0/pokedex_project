import 'package:flutter/material.dart';
import 'package:pokedex_project/components/pokemon_types.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonCards extends StatelessWidget {
  const PokemonCards({
    Key? key,
    required this.future,
    required this.futureType,
    required this.nextPage,
  }) : super(key: key);

  final Future<PokemonModel> future;
  final Future<List<PokeTypeModel>> futureType;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
          child: InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => nextPage)),
            child: Stack(children: [
              Container(
                width: size.width,
                height: size.height,
                margin:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/img/card_background.jpg',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.4),
                  ),
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
              Positioned(
                  top: 55.0,
                  right: -45.0,
                  child: PokemonTypes(futureType: futureType))
            ]),
          ),
        );
      },
    );
  }
}
