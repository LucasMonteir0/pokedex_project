import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:pokedex_project/ui/components/pokemon_widgets/pokemon_types.dart';
import 'package:pokedex_project/ui/view/details_page.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.data}) : super(key: key);

  final PokeModel data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(index: data.id)),
        ),
        child: Stack(children: [
          Container(
            width: size.width,
            height: size.height,
            margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
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
            child: Text('#${data.id}'),
          ),
          Positioned(
            top: 30.0,
            left: 10.0,
            child: SizedBox(
              width: 110,
              child: Text(
                data.name.capitalize(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            right: 2,
            child: SizedBox(
              width: 100,
              child: Image.network(
                data.image,
              ),
            ),
          ),
          Positioned(
              top: 55.0,
              right: -45.0,
              child: PokemonTypes(
                type: data.type,
              ))
        ]),
      ),
    );
  }
}