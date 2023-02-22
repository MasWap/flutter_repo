import 'package:flutter_repo/models/type_habitats.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String addresse;
  int chambres;
  int superficie;
  double prixmois;

  Habitation(this.id, this.typeHabitat, this.image, this.libelle, this.addresse, this.chambres,
      this.superficie, this.prixmois);
}


