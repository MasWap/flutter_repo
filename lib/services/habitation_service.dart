import 'package:flutter_repo/models/habitation.dart';
import 'package:flutter_repo/models/habitation_data.dart';
import 'package:flutter_repo/models/type_habitats.dart';
import 'package:flutter_repo/models/typehabitat_data.dart';

class HabitationService {

  var  _typeHabitats;
  var _habitations;

  HabitationService() {
    // Different type of habitats
    _typeHabitats = TypehabitatData.buildList();
    // Generate 30 random habitations
    _habitations = HabitationsData.buildList();
  }

  /// Get all types of habitat
  List<TypeHabitat> getTypeHabitats() {
    return _typeHabitats;
  }

  /// Get the top 10 habitations
  List<Habitation> getHabitationsTop10() {
    return _habitations
        .where((habitation) => habitation.id%2 == 1)
        .take(10)
        .toList();
  }

  /// Get all habitations of maison type
  List<Habitation> getMaisons() {
    return _getHabitations(isHouse: true);
  }

  /// Get all habitations of appartements type
  List<Habitation> getAppartements() {
    return _getHabitations(isHouse: false);
  }

  /// Get habitations depending on the type habitat (appartement, maison)
  List<Habitation> _getHabitations({bool isHouse = true})  {
    return _habitations
        .where((habitation) => habitation.typeHabitat.id == (isHouse ? 1 : 2))
        .toList();
  }
}
