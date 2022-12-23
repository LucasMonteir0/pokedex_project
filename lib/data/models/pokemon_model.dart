class PokemonModel {
  final String name;
  final String image;
  final int id;

  PokemonModel({
    required this.name,
    required this.id,
    required this.image,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) => PokemonModel(
        id: map['id'],
        name: map['name'],
        image: map['sprites']['other']['home']['front_default'],
      );
}
