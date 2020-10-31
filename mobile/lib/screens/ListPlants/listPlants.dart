import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/Plants/PlantListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListPlants extends StatefulWidget {
  @override
  _ListPlantsState createState() => _ListPlantsState();
}

class _ListPlantsState extends State<ListPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas platas',
          style: TextStyle(
              fontFamily: 'OpenSans', color: Color(0xff272727), fontSize: 22),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Feather.x, color: Colors.grey.shade400)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: FutureBuilder<Object>(
          future: PlantService().plantsUser(),
          builder: (context, snapshot) {
            print(snapshot);
            return Column(
              children: <Widget>[
                PlantListTile('Mudinha'),
                PlantListTile('Cactus Jake'),
                PlantListTile('Jubileu'),
              ],
            );
          }
        ),
      ),
    );
  }
}
