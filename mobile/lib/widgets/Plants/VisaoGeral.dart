import 'package:cultive/models/plant.dart';
import 'package:cultive/widgets/utils/CustomFloatingButton.dart';
import 'package:cultive/widgets/utils/CustomGridList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class VisaoGeral extends StatelessWidget {
  Plant plant;

  VisaoGeral(Plant plant) {
    this.plant = plant;
  }

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
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1425736351320-d66d7583fe62?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("\u{2600} Muita Luz",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 60,
                    child: Image.network(
                      "http://10.0.2.2:3333/uploads/avatar_plants/avatar1.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Nome Popular',
                            style: TextStyle(
                                color: Color(0xff297F4E), fontSize: 12),
                          ),
                          Text('Dedo de Moça',
                              style: TextStyle(
                                  color: Color(0xff297F4E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Nome Ciêntifico',
                            style: TextStyle(
                                color: Color(0xff297F4E), fontSize: 12),
                          ),
                          Text('Sedum rurotinchtruom Dentre',
                              style: TextStyle(
                                  color: Color(0xff297F4E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )),
                ],
              ),
            ),
            _buildSection('Mais informações',
                'As samambaias são vegetais vasculares membros do táxon das pteridófitas (que deixou de ter validade taxonômica e só é utilizado como uma denominação informal). Elas possuem tecidos vasculares (xilema e floema), folhas verdadeiras, se reproduzem através de esporos e não produzem sementes ou flores. A diversificação das samambaias parece ter ocorrido no Devoniano (há mais de 400 milhões de anos). Elas foram essenciais na ocupação dos ambientes terrestres pelos animais, fornecendo habitat e alimento além de serem importantes na formação do solo rico em nutrientes que viria a propiciar a formação das grandes florestas do carbonífero. Neste período as samambaias e as licófitas eram as principais representantes vegetais do planeta.'),
            _buildSection('Observações',
                'Molhar o solo e espirrar água nas folhas. Evite regar as folhas.'),
            CustomGridList(
                'Fertilizantes', ['Farinha de osso', 'Torta de mamona']),
            CustomGridList('Melhores ambientes',
                ['Garagem', 'Sala de estar', 'Locais fechados']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection('Escala de Cuidado', 'Muito bem Cuidada',
                        width: 230),
                    Container(
                      width: 200,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: LinearProgressIndicator(
                        value: 0.9,
                        backgroundColor: Colors.grey.shade300,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff297F4E)),
                        minHeight: 5,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: CustomFloatingButton(
                    Color(0xff6ACC91),
                    Icon(Feather.edit, size: 30, color: Colors.white,),
                    null,
                  ),
                )
              ],
            ),
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
