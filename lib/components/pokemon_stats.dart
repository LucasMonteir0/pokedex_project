import 'package:flutter/material.dart';
import 'package:pokedex_project/data/models/poke_stats_model.dart';
import 'package:string_capitalize/string_capitalize.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    super.key,
    required this.status,
  });

  final List<PokeStatsModel> status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) => Column(
                children: status.map<Widget>((e) {
                  return Row(
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
                          e.baseStat.toString(),
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
                            semanticsValue: 'done',
                            value: double.parse('${e.baseStat / 100}'),
                            backgroundColor: Colors.grey.shade300,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )),
    );
  }
}
