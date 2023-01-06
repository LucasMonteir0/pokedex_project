import 'package:pokedex_project/data/models/poke_stats_model.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';

class PokeModel {
  final int id;
  final String name;
  final String image;
  final List<PokeTypesModel> type;
  final List<PokeStatsModel> status;

  PokeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.status,
  });

  factory PokeModel.fromMap(Map<String, dynamic> map) {
    final String image = map["sprites"]["other"]["home"]["front_default"];
    final List<PokeTypesModel> type = map["types"]
        .map<PokeTypesModel>((value) => PokeTypesModel.fromMap(value))
        .toList();

    final List<PokeStatsModel> status = map["stats"]
        .map<PokeStatsModel>((value) => PokeStatsModel.fromMap(value))
        .toList();
    return PokeModel(
        id: map["id"],
        name: map["name"],
        image: image,
        type: type,
        status: status);
  }
}
