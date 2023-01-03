class PokeStatsModel {
  final String name;
  final int stat;

  PokeStatsModel({
    required this.name,
    required this.stat,
  });

  factory PokeStatsModel.fromMap(Map<String, dynamic> map) => PokeStatsModel(
        name: map['stat']['name'],
        stat: map['base_stat'],
      );
}
