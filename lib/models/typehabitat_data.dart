import 'package:flutter_repo/models/type_habitats.dart';

class TypehabitatData {
  static final data = [
    {"id": 1, "libelle": "Maison"},
    {"id": 2, "libelle": "Appartement"}
  ];

  static List<TypeHabitat> buildList() {
    return data.map((item) => TypeHabitat.fromJson(item)).toList();
  }
}
