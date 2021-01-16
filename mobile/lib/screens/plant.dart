import 'package:cultive/models/plant.dart';
import 'package:cultive/models/plant_details.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/plants/action.dart';
import 'package:cultive/widgets/plants/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class PlantPage extends StatefulWidget {
  final Plant plant;
  final int initialIndex;

  PlantPage(this.plant, {this.initialIndex = 0});

  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  PlantDetails _plantDetails;
  PlantService _plantService;

  Future<void> init() async {
    _plantService = Provider.of<PlantService>(context, listen: false);  
    _plantDetails = await _plantService.show(widget.plant.id.toString());

    if (mounted) 
      setState(() { });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.plant.name,
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
            initialIndex: widget.initialIndex,
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
                      Overview(widget.plant, _plantDetails),
                      ActionPage(ActionPageTypes.Regar, widget.plant),
                      ActionPage(ActionPageTypes.Podar, widget.plant),
                      ActionPage(ActionPageTypes.Adubar, widget.plant),
                    ]),
                  ),
                )
              ],
            )));
  }

  List<Widget> _buildTabs() {
    return [
      Tab(
          child: FittedBox(
              child:
                  Text('Geral', style: TextStyle(color: Color(0xff297F4E))))),
      Tab(
          child: FittedBox(
              child:
                  Text('Regar', style: TextStyle(color: Color(0xff297F4E))))),
      Tab(
          child: FittedBox(
              child:
                  Text('Podar', style: TextStyle(color: Color(0xff297F4E))))),
      Tab(
          child: FittedBox(
              child:
                  Text('Adubar', style: TextStyle(color: Color(0xff297F4E))))),
    ];
  }
}