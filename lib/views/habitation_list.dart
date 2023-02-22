import 'package:flutter/material.dart';
import 'package:flutter_repo/models/habitation.dart';
import 'package:flutter_repo/services/habitation_service.dart';
import 'package:flutter_repo/views/habitation_details.dart';
import 'package:flutter_repo/views/share/habitation_features_widget.dart';
import 'package:flutter_repo/views/share/habitation_option.dart';
import 'package:intl/intl.dart';

class HabitationList extends StatelessWidget {
  final HabitationService service = HabitationService();
  late List<Habitation> _habitations;
  final bool isHouseList;

  HabitationList(this.isHouseList, {Key? key}) : super(key: key) {
    _habitations =
    isHouseList ? service.getMaisons() : service.getAppartements();
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat("### €");
    return Container(
      child: Column(
        children: [
          // Top row
          Row(
            children: [
              // Right
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.addresse),
                ),
              ),
              // Left
              Expanded(
                flex: 1,
                child: Text(
                  format.format(habitation.prixmois),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          HabitationFeaturesWidget(habitation),
        ],
      ),
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HabitationDetails(habitation)),
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/locations/${habitation.image}",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            _buildDetails(habitation),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste des ${isHouseList ? "maison" : "appartements"}",
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _habitations.length,
          itemBuilder: (context, index) =>
              _buildRow(_habitations[index], context),
          itemExtent: 285,
        ),
      ),
    );
  }
}
