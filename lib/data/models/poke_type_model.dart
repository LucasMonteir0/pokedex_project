class PokeTypesModel {
  final String name;
  final int slot;

  PokeTypesModel({required this.name, required this.slot});

  factory PokeTypesModel.fromMap(Map<String, dynamic> map) {
    final name = map["type"]["name"];
    final slot = map["slot"];
    return PokeTypesModel(name: name, slot: slot);
  }
}

