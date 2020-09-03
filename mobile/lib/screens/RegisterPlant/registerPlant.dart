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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationScreen()))
                      },
                  child: Icon(Feather.x, color: Colors.grey)),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Cadastrar Planta',
                    style: TextStyle(
                        color: Color(0xff272727),
                        fontSize: 22,
                        fontFamily: 'OpenSans')),
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffD8E5DD),
                child: 
                Center(child: Text('Toque caso queira adicionar uma foto da planta.')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
