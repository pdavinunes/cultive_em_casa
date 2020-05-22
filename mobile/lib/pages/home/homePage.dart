import 'package:cultive_em_casa_app/pages/home/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cultive_em_casa_app/pages/plants/addPlantPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _value = "1";
  Widget _widgetTeste = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 30.0,
          backgroundColor: Color(0xff55e890),
          title: Text(
            "Inicio",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'images/lupa.svg',
                color: Colors.white,
                width: 22,
              ),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddPlantPage();
                  }));
                }),
          ],
        ),
        backgroundColor: Color(0xffF1F5F9),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.2))),
                child: Center(child: _dropDownButton()),
              ),
              _widgetTeste
            ],
          ),
        ));
  }

  Widget planta1() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 140,
                width: 140,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 2.0,
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/sol.png"),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      "Radiação Solar",
                      style: TextStyle(
                          color: Color(0xff55e890),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "01 UV",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Color(0xff4F4F4F),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                width: 140,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 2.0,
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/umidade.png"),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      "Umidade",
                      style: TextStyle(
                          color: Color(0xff55e890),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "40%",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4F4F4F),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 2.0,
              )
            ]),
            height: 80,
            width: 1 / 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Próxima Irrigação",
                      style: TextStyle(color: Color(0xff55e890), fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "16:30",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold, color: Color(0xff4F4F4F)),
                    )
                  ],
                ),
                Image.asset("images/regar.png"),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 2.0,
              )
            ]),
            height: 180,
            width: 1 / 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Quantidade de água (ml)",
                  style: TextStyle(color: Color(0xff55e890), fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Expanded(child: SimpleBarChart.withSampleData()),
              ],
            ),
          ),
          Divider(),
          FlatButton(
            child: Text('ver todos os indicadores',
                style: TextStyle(color: Color(0xff55e890), fontSize: 15)),
            onPressed: () {},
            color: Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Colors.grey.shade400)),
          )
        ],
      ),
    );
  }

  Widget planta2() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 140,
                width: 140,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 2.0,
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/sol.png"),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      "Radiação Solar",
                      style: TextStyle(
                          color: Color(0xff55e890),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "01 UV",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Color(0xff4F4F4F),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 140,
                width: 140,
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 2.0,
                  )
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("images/umidade.png"),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      "Umidade",
                      style: TextStyle(
                          color: Color(0xff55e890),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "37%",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4F4F4F),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 2.0,
              )
            ]),
            height: 80,
            width: 1 / 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Próxima Irrigação",
                      style: TextStyle(color: Color(0xff55e890), fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "17:35",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold, color: Color(0xff4F4F4F)),
                    )
                  ],
                ),
                Image.asset("images/regar.png"),
              ],
            ),
          ),
          Divider(
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 2.0,
              )
            ]),
            height: 180,
            width: 1 / 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Quantidade de água (ml)",
                  style: TextStyle(color: Color(0xff55e890), fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Expanded(child: SimpleBarChart.withSampleData2()),
              ],
            ),
          ),
          Divider(),
          FlatButton(
            child: Text('ver todos os indicadores',
                style: TextStyle(color: Color(0xff55e890), fontSize: 15)),
            onPressed: () {},
            color: Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Colors.grey.shade400)),
          )
        ],
      ),
    );
  }

  DropdownButton _dropDownButton() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "1",
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'images/plant.svg',
                  color: Color(0xff55e890),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Maria Babuçu",
                  style: TextStyle(
                      color: Color(0xff4F4F4F),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'images/plant.svg',
                  color: Color(0xff55e890),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Jambu do Mato",
                  style: TextStyle(
                      color: Color(0xff4F4F4F),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
            _widgetTeste = value == "1" ? planta1() : planta2();
          });
        },
        value: _value,
        elevation: 2,
        style: TextStyle(color: Colors.black87, fontSize: 22),
        isExpanded: true,
        iconSize: 40.0,
        icon: Icon(Icons.keyboard_arrow_down),
        underline: Text(''),
      );
}
