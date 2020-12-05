import 'package:cultive/models/plant.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/Plants/PlantListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListPlants extends StatefulWidget {
  @override
  _ListPlantsState createState() => _ListPlantsState();
}

class _ListPlantsState extends State<ListPlants> {

  List<dynamic> plantsPerUser;

  _getPlants() async {
    final response = await PlantService().plantsUser();
    setState((){
      if(response != null) {
        plantsPerUser = response['plants_per_user'];
      }
    });
  }


  @override
  void initState(){
    super.initState();
    _getPlants();
  }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: plantsPerUser == null ? _buildEmptyList() : _buildListPlants()
      ),
    );
  }

  Widget _buildListPlants() { 
    return ListView.builder(
      itemCount: plantsPerUser?.length ?? 0,
      itemBuilder: (context, index) {
        final plant = plantsPerUser[index];
        return PlantListTile(plant['name'] ?? '');
      }
    );
  }
  
  Widget _buildEmptyList() { 
    return Container(child: Text('sem plantas irmão'));
  }
}

class ResponsePlantsModel {
  String status;
  String message;
  List<Plant> plantsPerUser; 

  ResponsePlantsModel({this.status, this.message = '', this.plantsPerUser});
  
}