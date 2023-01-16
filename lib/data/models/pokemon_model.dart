import 'package:flutter/material.dart';
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
      status: status,
    );
  }

  Color? get baseColor => _color(type: type[0].name);

  static Color? _color({required String type}) {
    switch (type) {
      case 'normal':
        return Colors.brown[400];
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'ice':
        return Colors.cyanAccent[400];
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange[300];
      case 'flying':
        return Colors.indigo[200];
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen[500];
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.indigo[400];
      case 'dark':
        return Colors.brown;
      case 'dragon':
        return Colors.indigo[800];
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
