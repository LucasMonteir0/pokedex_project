import 'package:dio/dio.dart';
import 'package:pokedex_project/config/api_url.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';

class PokemonRepository {
  final _dio = Dio();

  Future<PokeModel> getPokemons(int index) async {
    try {
      final response =
          await _dio.get('${ApiUrl.baseUrl}${ApiUrl.pokemon}$index');

      final PokeModel pokemons = PokeModel.fromMap(response.data);

      return pokemons;
    } catch (e) {
      throw Exception(e);
    }
  }
}
