import 'package:cultive/models/plant.dart';
import 'package:cultive/screens/plant.dart';
import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  PlantCard(this.plant);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PlantPage(this.plant))),
        child: Container(
          width: 170,
          height: 170,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0x22000026),
                    offset: Offset(1, 1),
                    blurRadius: 6)
              ],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.plant.name,
                  style: TextStyle(
                      color: Color(0xff272727),
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              Row(
                children: <Widget>[
                  Container(
                      height: 120,
                      width: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("\u{2600} Muita Luz",
                              style: TextStyle(
                                  color: Color(0xff297F4E), fontSize: 12)),
                          Text("\u{1F321} 20 - 25 º",
                              style: TextStyle(
                                  color: Color(0xff297F4E), fontSize: 12)),
                          Text("\u{1F4A7} Frequente",
                              style: TextStyle(
                                  color: Color(0xff297F4E), fontSize: 12)),
                        ],
                      )),
                  Container(
                    height: 120,
                    width: 60,
                    child: Image.network(
                      "http://10.0.2.2:3333/uploads/avatar_plants/avatar1.png",
                    ),
                  )
                ],
              ),
              Text("+ Mais informações",
                  style: TextStyle(
                      color: Color(0xff297F4E),
                      fontWeight: FontWeight.bold,
                      fontSize: 8)),
            ],
          ),
        ),
      ),
    ]);
  }
}
