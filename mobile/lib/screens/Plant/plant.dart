import 'package:cultive/models/plant.dart';
import 'package:cultive/widgets/Plants/Action.dart';
import 'package:cultive/widgets/Plants/VisaoGeral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlantPage extends StatefulWidget {
  final Plant plant;

  PlantPage(this.plant);

  @override
  _PlantPageState createState() => _PlantPageState(this.plant);
}

class _PlantPageState extends State<PlantPage> {
  Plant plant;

  _PlantPageState(Plant plant) {
    this.plant = plant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            this.plant.name,
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
        backgroundColor: Colors.white,
        body: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    tabs: _buildTabs(),
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2, color: Color(0xff297F4E)),
                      insets: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(children: [
                      VisaoGeral(this.plant),
                      ActionPage(ActionPageTypes.Regar),
                      ActionPage(ActionPageTypes.Podar),
                      ActionPage(ActionPageTypes.Adubar),
                    ]),
                  ),
                )
              ],
            )));
  }

  List<Widget> _buildTabs() {
    return [
      Tab(child: Text('Geral', style: TextStyle(color: Color(0xff297F4E)))),
      Tab(child: Text('Regar', style: TextStyle(color: Color(0xff297F4E)))),
      Tab(child: Text('Podar', style: TextStyle(color: Color(0xff297F4E)))),
      Tab(child: Text('Adubar', style: TextStyle(color: Color(0xff297F4E)))),
    ];
  }
}
