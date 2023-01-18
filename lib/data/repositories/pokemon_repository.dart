import 'package:dio/dio.dart';
import 'package:pokedex_project/config/api_url.dart';
import 'package:pokedex_project/data/models/pokemon_model.dart';

class PokemonRepository {
  final _dio = Dio();

  Future<List<PokeModel>> getPokemons() async {
    final List<int> listNum = List.generate(906, (index) => index);
    List<PokeModel> listPokeModel = [];
    try {
      for (int i = 1; i < listNum.length; ++i) {
        final response = await _dio.get('${ApiUrl.baseUrl}${ApiUrl.pokemon}$i');
        final PokeModel pokemons = PokeModel.fromMap(response.data);
        listPokeModel.add(pokemons);
      }

      return listPokeModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
