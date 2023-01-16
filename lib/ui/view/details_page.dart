import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';
import 'package:pokedex_project/ui/components/pokemon_widgets/pokemon_stats.dart';
import 'package:pokedex_project/ui/components/pokemon_widgets/pokemon_types.dart';
import 'package:pokedex_project/ui/components/rounded_button.dart';
import 'package:string_capitalize/string_capitalize.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final PokeModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SafeArea(
          child: Stack(children: [
            Container(
                width: size.width,
                height: size.height,
                color: data.baseColor!.withOpacity(0.7)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(15 / 360),
                  child: Image.asset(
                    'assets/img/pokeball_background.png',
                    opacity: const AlwaysStoppedAnimation(0.1),
                    scale: 1.3,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Image.network(
                  data.image,
                  scale: 1.6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
                    data.name.capitalize(),
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                PokemonTypes(
                  type: data.type,
                  isRow: true,
                ),
              ],
            ),
            RoundedButton(
              onPressed: () => Navigator.pop(context),
            ),
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
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PokemonStats(
                        status: data.status,
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
