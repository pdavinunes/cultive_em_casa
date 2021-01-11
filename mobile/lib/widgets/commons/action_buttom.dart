import 'package:cultive/screens/list_plants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final int inititalIndex;
  final String description;
  final String imageSrc;
  final Color color;

  const ActionButton({
    @required this.inititalIndex,
    @required this.description,
    @required this.imageSrc,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ListPlants(
                  initialIndex: inititalIndex,
                )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        margin: EdgeInsets.only(top: 10, right: 25),
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Image.asset("lib/assets/images/$imageSrc")
          ],
        ),
      ),
    );
  }
}
