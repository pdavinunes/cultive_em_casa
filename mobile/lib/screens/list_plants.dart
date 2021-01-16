import 'package:cultive/models/plant.dart';
import 'package:cultive/screens/plant.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/plants/plant_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListPlants extends StatefulWidget {
  final int initialIndex;

  ListPlants({this.initialIndex = 0});

  @override
  _ListPlantsState createState() => _ListPlantsState();
}

class _ListPlantsState extends State<ListPlants> {
  List<dynamic> plantsPerUser;

  _getPlants() async {
    final response = await PlantService().plantsUser();
    setState(() {
      if (response != null) {
        plantsPerUser = response['plants_per_user'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getPlants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas plantas',
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child:
              plantsPerUser == null ? _buildEmptyList() : _buildListPlants()),
    );
  }

  Widget _buildListPlants() {
    return ListView.builder(
        itemCount: plantsPerUser?.length ?? 0,
        itemBuilder: (context, index) {
          final plant = Plant.fromMap(plantsPerUser[index]);
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlantPage(
                      plant,
                      initialIndex: widget.initialIndex,
                    ))),
            child: PlantListTile(plant),
          );
        });
  }

  Widget _buildEmptyList() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'lib/assets/images/404.png',
            height: 125,
            width: 175,
          ),
          Text(
            'Sem plantas cadastras :( ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class ResponsePlantsModel {
  String status;
  String message;
  List<Plant> plantsPerUser;

  ResponsePlantsModel({this.status, this.message = '', this.plantsPerUser});
}
