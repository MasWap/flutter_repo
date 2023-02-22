import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repo/views/share/habitation_optionPayante.dart';
import 'package:intl/intl.dart';

class ResaLocation extends StatefulWidget {
  const ResaLocation({Key? key}) : super(key: key);

  @override
  State<ResaLocation> createState() => _ResaLocationState();
}

class _ResaLocationState extends State<ResaLocation> {
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  String ngPersonnes = '1';
  List<OptionPayanteCheck> optionPayanteChecks = [];

  var format = NumberFormat("### €");

  @override
  Widget build(BuildContext context) {
    _loadOptionPayantes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Réservation"),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          _buildResume(),
          _buildDates(),
          _buildNbPersonnes(),
          _buildOptionsPayantes(context),
          TotalWidget(prixTotal),
          _buildRentButton(),
        ],
      ),
    );
  }
}
