import 'package:cultive/models/plant.dart';
import 'package:cultive/widgets/commons/custom_grid_list.dart';
import 'package:cultive/widgets/plants/plant_avatar.dart';
import 'package:flutter/material.dart';
import 'package:cultive/.env.dart' as env; 

class Overview extends StatelessWidget {
  final Plant plant;

  const Overview(this.plant);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Container(
                width: 1 / 0,
                height: 90.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${env.API_URL}${plant.imageSrc}')),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("\u{2600} ${plant.lightness}",
                          style: TextStyle(
                              color: Color(0xff297F4E), fontSize: 12)),
                      Text("\u{1F321} 20 - 25 º",
                          style: TextStyle(
                              color: Color(0xff297F4E), fontSize: 12)),
                      Text("\u{1F4A7} Frequente",
                          style: TextStyle(
                              color: Color(0xff297F4E), fontSize: 12)),
                    ])),
            Divider(),
            Container(
              width: 1 / 0,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: PlantAvatar(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Nome Popular',
                          style:
                              TextStyle(color: Color(0xff297F4E), fontSize: 12),
                        ),
                        Text(plant.popularName,
                            style: TextStyle(
                                color: Color(0xff297F4E),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nome Ciêntifico',
                          style:
                              TextStyle(color: Color(0xff297F4E), fontSize: 12),
                        ),
                        Text(plant.scientificName,
                            style: TextStyle(
                                color: Color(0xff297F4E),
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSection('Mais informações', plant.description),
            _buildSection('Observações', plant.comments),
            CustomGridList(
                'Fertilizantes', ['Farinha de osso', 'Torta de mamona']),
            CustomGridList('Melhores ambientes',
                ['Garagem', 'Sala de estar', 'Locais fechados']),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description,
      {double width = 1 / 0}) {
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(color: Color(0xff297F4E), fontSize: 12),
        ),
        SizedBox(
          height: 5,
        ),
        Text(description,
            style: TextStyle(
                color: Color(0xff297F4E),
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ]),
    );
  }
}
