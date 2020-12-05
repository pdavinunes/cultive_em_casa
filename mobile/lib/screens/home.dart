import 'package:cultive/models/plant.dart';
import 'package:cultive/screens/list_plants.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/plants/plant_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(25, 20, 0, 15),
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Minhas plantas",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xff266E46))),
            Container(
              height: 180,
              child: ListView.builder(
                  itemCount: plantsPerUser?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final plant = Plant.fromMap(plantsPerUser[index]);
                    return PlantCard(plant);
                  }),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ListPlants()));
                  },
                  child: Text(
                    "ver todas as plantas",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xff266E46),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                margin: EdgeInsets.only(top: 15, right: 25),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff5993C8),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("VAMOS REGAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Image.asset("lib/assets/images/regar.png")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                margin: EdgeInsets.only(top: 15, right: 25),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff6ACC91),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("VAMOS PODAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Image.asset("lib/assets/images/podar.png")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                margin: EdgeInsets.only(top: 15, right: 25),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffC16544),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("VAMOS ADUBAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Image.asset("lib/assets/images/adubar.png")
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
