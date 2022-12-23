class PokeTypeModel {
  final String name;

  PokeTypeModel({required this.name});

  factory PokeTypeModel.fromMap(Map<String, dynamic> map) => PokeTypeModel(
        name: map['type']['name'],
      );
}
