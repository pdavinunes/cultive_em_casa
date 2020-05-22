import 'package:cultive_em_casa_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      appBar: AppBar(
        titleSpacing: 30.0,
        backgroundColor: Color(0xff55e890),
        title: Text(
          "Perfil",
          style: TextStyle(fontSize: 23.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 110,
              height: 110,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.only(top: 30, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xff55e890),
                  borderRadius: BorderRadius.all(Radius.circular(110.0))),
              child: Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Color(0xffF1F5F9),
                    borderRadius: BorderRadius.all(Radius.circular(110.0))),
                child: ClipOval(
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              'Silvio Lira',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4f4f4f)),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: ListTile(
                      onTap: () {},
                      leading: IconButton(
                          iconSize: 30.0,
                          color: Color(0xff55e890),
                          onPressed: () {}, icon: Icon(Icons.account_circle)),
                      title: Text("Minhas Informações", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                      ),),
                      trailing: Icon(
                        Icons.chevron_right, color: Color(0xff55e890),
                        size: 40.0,),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: ListTile(
                      onTap: () {},
                      leading: IconButton(
                          iconSize: 30.0,
                          color: Color(0xff55e890),
                          onPressed: () {},
                          icon: Icon(Icons.settings_applications)),
                      title: Text("Configurações", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                      ),),
                      trailing: Icon(
                        Icons.chevron_right, color: Color(0xff55e890),
                        size: 40.0,),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: ListTile(
                      onTap: () {},
                      leading: IconButton(
                          iconSize: 30.0,
                          color: Color(0xff55e890),
                          onPressed: () {}, icon: Icon(Icons.info)),
                      title: Text("Sobre nós", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                      ),),
                      trailing: Icon(
                        Icons.chevron_right, color: Color(0xff55e890),
                        size: 40.0,),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: ListTile(
                      onTap: () async{
                        await _auth.signOut();
                        
                      },
                      leading: IconButton(
                          iconSize: 30.0,
                          color: Color(0xff55e890),
                          onPressed: () {}, icon: Icon(Icons.exit_to_app)),
                      title: Text("Sair", style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                      ),),
                      trailing: Icon(
                        Icons.chevron_right, color: Color(0xff55e890),
                        size: 40.0,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
