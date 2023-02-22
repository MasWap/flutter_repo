import 'package:flutter/material.dart';
import 'package:flutter_repo/models/habitation.dart';

import 'habitation_option.dart';

class HabitationFeaturesWidget extends StatelessWidget {
  final Habitation _habitation;

  const HabitationFeaturesWidget(this._habitation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HabitationOption(
            "${_habitation.nbPersonnes} personnes", Icons.group),
        HabitationOption(
            "${_habitation.chambres} chambres", Icons.bed),
        HabitationOption(
            "${_habitation.superficie} m²", Icons.fit_screen),
      ],
    );
  }
}
