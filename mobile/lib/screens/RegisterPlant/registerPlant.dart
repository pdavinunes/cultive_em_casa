import 'package:cultive/screens/Navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RegisterPlant extends StatefulWidget {
  @override
  _RegisterPlantState createState() => _RegisterPlantState();
}

class _RegisterPlantState extends State<RegisterPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Planta',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffD8E5DD),
                child: Center(
                    child: Text(
                        'Toque caso queira adicionar uma foto da planta.')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(children: [
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Qual o apelido da Planta?'),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Qual o nome popular da Planta?'),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Nome ciêntifico da planta',
                      style: TextStyle(
                        color: Color(0xff297F4E),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      )),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Endereço da plantinha?',
                      suffixIcon: Icon(
                        Ionicons.md_locate,
                        color: Color(0xff297F4E),
                      )),
                ),
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Horário da última rega?'),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {},
                child: Text('CADASTRAR PLANTA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                color: Color(0xff297F4E), 
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
