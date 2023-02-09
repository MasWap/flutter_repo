import 'package:flutter_repo/services/habitation_service.dart';
import 'package:flutter_repo/share/habitation_option.dart';
import 'package:flutter_repo/views/habitation_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repo/models/habitation.dart';
import 'package:flutter_repo/models/type_habitats.dart';
import 'package:flutter_repo/share/location_style.dart';
import 'package:flutter_repo/share/location_text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mes locations'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final HabitationService service = HabitationService();
  final String title;
  late List<TypeHabitat> _typeHabitats;
  late List<Habitation> _habitations;

  MyHomePage({required this.title, Key? key}) : super(key: key) {
    _habitations = service.getHabitationsTop10();
    _typeHabitats = service.getTypeHabitats();
  }

  _buildTypeHabitat(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _typeHabitats.length,
          (index) => _buildHabitat(context, _typeHabitats[index]),
        ),
      ),
    );
  }

  _buildHabitat(BuildContext context, TypeHabitat typeHabitat) {
    IconData icon;
    switch (typeHabitat.id) {
      case 1:
        icon = Icons.house;
        break;
      case 2:
        icon = Icons.apartment;
        break;
      default:
        icon = Icons.home;
    }
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: LocationStyle.backgroundColorPurple,
            borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HabitationList(typeHabitat.id == 1),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white70,
                ),
                const SizedBox(width: 5),
                Text(
                  typeHabitat.libelle,
                  style: LocationTextStyle.regularWhiteTextStyle,
                ),
              ],
            )),
      ),
    );
  }


  _buildDerniereLocation(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: _habitations.length,
        itemExtent: 220,
        itemBuilder: (context, index) =>
            _buildRow(_habitations[index], context),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat("### €");

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.addresse),
                ),
              ),
          Expanded(
            flex: 1,
            child: Text(format.format(habitation.prixmois),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 22,
            ),),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HabitationOption(Icons.group, "${habitation.chambres} personnes"),
          HabitationOption(Icons.fit_screen, "${habitation.superficie} m2"),
            ],
          ),
        ],
      ),
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {

    var format = NumberFormat("### €");

    return Container(
      width: 248,
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/locations/${habitation.image}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          _buildDetails(habitation),
        ],
      ),
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            _buildTypeHabitat(context),
            SizedBox(height: 20),
            _buildDerniereLocation(context),
          ],
        ),
      ),
    );
  }
}