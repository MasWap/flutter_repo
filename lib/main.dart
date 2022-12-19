import 'package:flutter/material.dart';
import 'package:flutter_repo/models/habitation.dart';
import 'package:flutter_repo/models/type_habitats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title, Key? key}) : super(key: key);

  var _typehabitats = [TypeHabitat(1, "Maison"), TypeHabitat(1, "Appartement")];
  var _habitations = [
    Habitaiton(1, "maison.png", "Maison méditerranéenne",
        "12 Rue du Coq qui chante", 3, 92, 600),
    Habitaiton(2, "appartement.png", "Appartement neuf", "Rue de la soif",
        1, 50, 555),
    Habitaiton(3, "appartement.png", "Appartement 1", "Rue 1", 1, 51, 401),
    Habitaiton(4, "appartement.png", "Appartement 2", "Rue 2", 2, 52, 402),
    Habitaiton(5, "maison.png", "Maison 1", "Rue M1", 3, 101, 701),
    Habitaiton(6, "maison.png", "Maison 2", "Rue M2", 3, 102, 702),
  ];

  _buildTypeHabitat() {
    return Container(
      height: 100,
      child: Row(
        children: List.generate(
          _typehabitats.length,
            (index) => _buildHabitat(_typehabitats[index])(),
        ),
      ),
    );
  }

  _buildHabitat(TypeHabitat typeHabitat) {
    var icon = Icons.house;
    switch (typeHabitat.id) {
      // case 1! House
      case 2:
        icon = Icons.apartment;
        break;
      default:
        icon = Icons.home;
    }
    return Container(
      height: 80,
      child: Row(
        children: [Icon(icon), Text(typeHabitat.libelle)],
      ),
    );
  }

  _buildDerniereLocation(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemBuilder: _habitations.length,
        itemExtent: 220,
        itemBuilder: (context, index) =>
            _buildRow(_habitations[index], context),
        scrollDirection: Axis.horizontal,
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
            _buildTypeHabitat(),
            _buildDerniereLocation(context),
          ],
        ),
      ),
    );
  }
}