class PokeStatsModel {
  final String name;
  final int baseStat;

  PokeStatsModel({required this.name, required this.baseStat});

  factory PokeStatsModel.fromMap(Map<String, dynamic> map) {
    final name = map["stat"]["name"];
    final stat = map["base_stat"];
    return PokeStatsModel(name: name, baseStat: stat);
  }
}
