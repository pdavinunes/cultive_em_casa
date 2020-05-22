import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPlantPage extends StatefulWidget {
  @override
  _AddPlantPageState createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        backgroundColor: Color(0xff75E8A3),
        title: Text(
          'Adicionar Planta',
        ),
      ),
      backgroundColor: Color(0xffF1F5F9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 110,
                height: 110,
                padding: EdgeInsets.all(6.0),
                margin: EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xff75E8A3),
                    borderRadius: BorderRadius.all(Radius.circular(110.0))),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Color(0xffF1F5F9),
                      borderRadius: BorderRadius.all(Radius.circular(110.0))),
                  child: Image.asset(
                    'images/planta.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 30,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset(
                          'images/user.svg',
                          color: Colors.grey,
                        ),
                        hintText: 'Nome da planta'),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset(
                          'images/user.svg',
                          color: Colors.grey,
                        ),
                        hintText: 'Tipo da Planta'),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset(
                          'images/user.svg',
                          color: Colors.grey,
                        ),
                        hintText: 'Idade da planta'),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset(
                          'images/user.svg',
                          color: Colors.grey,
                        ),
                        hintText: 'Tamanho do vaso'),
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 50,
              ),
              RaisedButton(
                onPressed: () {},
                color: Color(0xff6ACC91),
                child: Text(
                  'ADICIONAR PLANTA',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
