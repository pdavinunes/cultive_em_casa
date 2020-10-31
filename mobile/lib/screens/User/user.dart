import 'package:cultive/models/user.dart';
import 'package:cultive/screens/Login/login.dart';
import 'package:cultive/screens/NotFound/notFound.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cultive/.env.dart' as env;

class UserScreen extends StatefulWidget {

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  User user;

  Future<void> init() async {
    user = Provider.of<User>(context, listen: false);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

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
                  fit: BoxFit.cover,
                  image: NetworkImage(env.API_URL+(user?.imageUrl ?? 'uploads/user_images/default.jpg'))),
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
                      AuthService().clearLoggedState();
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
