import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(25, 20, 0, 15),
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Minhas plantas",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xff266E46))),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 170,
                    padding: EdgeInsets.all(10),
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
                        Text("Mudinha",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("\u{2600} Muita Luz",
                                        style: TextStyle(
                                            color: Color(0xff297F4E),
                                            fontSize: 12)),
                                    Text("\u{1F321} 20 - 25 º",
                                        style: TextStyle(
                                            color: Color(0xff297F4E),
                                            fontSize: 12)),
                                    Text("\u{1F4A7} Frequente",
                                        style: TextStyle(
                                            color: Color(0xff297F4E),
                                            fontSize: 12)),
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
                  SizedBox(width: 15),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: () {},
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
                height: 62,
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
                height: 62,
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
                height: 62,
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
