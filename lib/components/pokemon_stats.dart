import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/poke_stats_model.dart';
import 'package:pokedex_project/data/repositories/pokemon_repository.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final repository = PokemonRepository();
    return FutureBuilder<List<PokeStatsModel>>(
      future: repository.getStats(index),
      builder: (context, snapshot) {
        final snapData = snapshot.data;
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) => Column(
                    children: snapData!
                        .map<Widget>((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150.0,
                                  child: Text(
                                    e.name.capitalize(),
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    e.stat.toString(),
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: LinearProgressIndicator(
                                      value: double.parse('0.${e.stat}'),
                                      backgroundColor: Colors.grey.shade300,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  )),
        );
      },
    );
  }
}
