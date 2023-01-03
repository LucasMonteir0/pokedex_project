import 'package:dio/dio.dart';
import 'package:pokedex_project/config/api_url.dart';
import 'package:pokedex_project/data/models/poke_stats_model.dart';
import 'package:pokedex_project/data/models/poke_type_model.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';

class PokemonRepository {
  final _dio = Dio();

  Future<PokemonModel> getPokemons(int index) async {
    try {
      final response =
          await _dio.get('${ApiUrl.baseUrl}${ApiUrl.pokemon}$index');

      final PokemonModel pokemons = PokemonModel.fromMap(response.data);

      return pokemons;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<PokeTypeModel>> getType(int index) async {
    try {
      final response =
          await _dio.get('${ApiUrl.baseUrl}${ApiUrl.pokemon}$index');

      final List<PokeTypeModel> types = response.data['types']
          .map<PokeTypeModel>((map) => PokeTypeModel.fromMap(map))
          .toList();

      return types;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<PokeStatsModel>> getStats(int index) async {
    try {
      final response =
          await _dio.get('${ApiUrl.baseUrl}${ApiUrl.pokemon}$index');

      final List<PokeStatsModel> stats = response.data['stats']
          .map<PokeStatsModel>((map) => PokeStatsModel.fromMap(map))
          .toList();

      return stats;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
