import 'package:flutter_repo/models/habitation.dart';

class OptionPayanteCheck extends OptionPayante {
  bool checked;

  OptionPayanteCheck(super.id, super.libelle, this.checked,
  {super.description = "", super.prix});

}