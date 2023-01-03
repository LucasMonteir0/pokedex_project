import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';

class PokemonTypes extends StatelessWidget {
  const PokemonTypes({
    Key? key,
    required this.futureType,
    this.isRow = false,
  }) : super(key: key);

  final Future<List<PokeTypeModel>> futureType;

  final bool isRow;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokeTypeModel>>(
      future: futureType,
      builder: (context, snapshot) {
        final snapData = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) => isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapData!
                        .map<Widget>(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 4.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e.name.toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapData!
                        .map<Widget>(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 65,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e.name.toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
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
        );
      },
    );
  }
}
