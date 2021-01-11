import 'package:cultive/models/plant.dart';
import 'package:cultive/providers/change_provider.dart';
import 'package:cultive/screens/list_plants.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/commons/action_buttom.dart';
import 'package:cultive/widgets/plants/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> plantsPerUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(25, 15, 0, 15),
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
            Expanded( 
              child: Consumer<ChangeProvider>(builder: (context, __, _) {
                return Consumer<PlantService>(builder: (context, service, _) {
                  return FutureBuilder<dynamic>(
                    future: service.plantsUser(),
                    builder: (_, snapshot) {
                      final response = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          response == null) {
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
                      plantsPerUser = response['plants_per_user'];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.28,
                            child: ListView.builder(
                                itemCount: plantsPerUser.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final plant =
                                      Plant.fromMap(plantsPerUser[index]);
                                  return PlantCard(plant);
                                }),
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 25),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ListPlants()));
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
                          ActionButton(
                            inititalIndex: 1,
                            color: const Color(0xff5993C8),
                            description: 'VAMOS REGAR',
                            imageSrc: 'regar.png',
                          ),
                          ActionButton(
                            inititalIndex: 2,
                            color: const Color(0xff6ACC91),
                            description: 'VAMOS PODAR',
                            imageSrc: 'podar.png',
                          ),
                          ActionButton(
                            inititalIndex: 3,
                            color: const Color(0xffC16544),
                            description: 'VAMOS ADUBAR',
                            imageSrc: 'adubar.png',
                          ),
                        ],
                      );
                    },
                  );
                });
              }),
            ),
          ]),
    );
  }
}
