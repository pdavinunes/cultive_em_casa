import 'package:flutter/material.dart';

class PlantListTile extends StatelessWidget {
  String name;

  PlantListTile(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        width: 1 / 0,
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0x22000026), offset: Offset(1, 1), blurRadius: 3)
            ],
            borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.name,
                    style: TextStyle(
                        color: Color(0xff272727),
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Container(
                    height: 90,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("\u{2600} Muita Luz   \u{1F321} 20 - 25 º",
                            style: TextStyle(
                                color: Color(0xff297F4E), fontSize: 12)),
                        Text("\u{1F4A7} Frequente",
                            style: TextStyle(
                                color: Color(0xff297F4E), fontSize: 12)),
                      ],
                    )),
                Text("+ Mais informações",
                    style: TextStyle(
                        color: Color(0xff297F4E),
                        fontWeight: FontWeight.bold,
                        fontSize: 8))
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 70,
                  child: Image.network(
                    "http://10.0.2.2:3333/uploads/avatar_plants/avatar1.png",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
