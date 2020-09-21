import 'package:cultive/screens/Login/login.dart';
import 'package:cultive/screens/NotFound/notFound.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 190.0,
            width: 200.0,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1561438484-8337264280c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=486&q=80')),
            ),
          ),
          Container(
            height: 280,
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Feather.settings, color: Color(0xff2E965B),),
                    title: Text('Configurações', style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                    trailing: Icon(Feather.chevron_right, color: Color(0xff2E965B),),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotFoundPage()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Feather.info, color: Color(0xff2E965B),),
                    title: Text('Dê seu feedback', style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                    trailing: Icon(Feather.chevron_right, color: Color(0xff2E965B),),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotFoundPage()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Feather.info, color: Color(0xff2E965B),),
                    title: Text('Sobre nós', style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                    trailing: Icon(Feather.chevron_right, color: Color(0xff2E965B),),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotFoundPage()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Feather.log_out, color: Color(0xff2E965B),),
                    title: Text('Sair', style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),),
                    trailing: Icon(Feather.chevron_right, color: Color(0xff2E965B),),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
