import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_repo/share/location_text_style.dart';
import 'package:flutter_repo/views/share/habitation_features_widget.dart';
import 'package:intl/intl.dart';

import '../models/habitation.dart';
import '../share/location_style.dart';

class HabitationDetails extends StatefulWidget {
  final Habitation _habitation;

  const HabitationDetails(this._habitation, {Key? key}) : super(key: key);

  @override
  State<HabitationDetails> createState() => _HabitationDetailsState();
}

class _HabitationDetailsState extends State<HabitationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget._habitation.libelle
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              "assets/images/locations/${widget._habitation.image}",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget._habitation.libelle),
                const SizedBox(height: 2),
                Text(widget._habitation.addresse),
                const Divider(),
              ],
            ),
          ),
          HabitationFeaturesWidget(widget._habitation),
          if (widget._habitation.options.isNotEmpty)
            _buildDivider("Inclus"),
          _buildItems(),
          if (widget._habitation.optionPayantes.isNotEmpty)
            _buildDivider("Options"),
          _buildOptionsPayantes(),
          _buildRentButton(),
        ],
      ),
    );
  }

  _buildRentButton() {
    var format = NumberFormat("### €");

    return Container(
      decoration: BoxDecoration(
          color: LocationStyle.backgroundColorPurple,
          borderRadius: BorderRadius.circular(8.0)
      ),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              format.format(widget._habitation.prixmois),
              style: LocationTextStyle.priceTextStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                print("Louer habitation");
              },
              child: const Text("Louer"),
            ),
          ),
        ],
      ),
    );
  }

  _buildItems() {
    // var width = (MediaQuery.of(context).size.width / 2) - 15;

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.options.length,
            (i) => Container(
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget._habitation.options[i].libelle
              ),
              Text(
                widget._habitation.options[i].description,
                style: LocationTextStyle.regularGreyTextStyle,
              )
            ],
          ),
        ),
      ).toList(),
    );
  }

  _buildOptionsPayantes() {
    var format = NumberFormat("### €");

    return Wrap(
      spacing: 2.0,
      children: Iterable.generate(
        widget._habitation.optionPayantes.length,
            (i) => Container(
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget._habitation.optionPayantes[i].libelle),
              Text(
                format.format(widget._habitation.optionPayantes[i].prix),
                style: LocationTextStyle.regularGreyTextStyle,
              )
            ],
          ),
        ),
      ).toList(),
    );
  }

  _buildDivider(String text) {
    return Row(
        children: [
          const SizedBox(width: 8),
          Text(text, style: LocationTextStyle.subtitleBoldTextStyle),
          const Expanded(
              child: Divider(
                height: 36,
                indent: 10.0,
              )
          ),
        ]
    );
  }

}
