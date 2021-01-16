import 'package:cultive/models/user.dart';
import 'package:cultive/screens/login.dart';
import 'package:cultive/screens/not_found.dart';
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
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(env.API_URL +
                      (user?.imageUrl ?? 'uploads/user_images/default.jpg'))),
            ),
          ),
          FittedBox(
            child: Text('Olá, ${user?.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                CardOption(
                  text: 'Configurações',
                  icon: Feather.settings,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotFoundPage()));
                  },
                ),
                CardOption(
                  text: 'Dê seu feedback',
                  icon: Feather.info,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotFoundPage()));
                  },
                ),
                CardOption(
                  text: 'Sobre nós',
                  icon: Feather.info,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotFoundPage()));
                  },
                ),
                CardOption(
                  text: 'Sair',
                  icon: Feather.log_out,
                  onTap: () {
                    AuthService().clearLoggedState();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  const CardOption({
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xff2E965B),
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Color(0xff333333),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Feather.chevron_right,
          color: Color(0xff2E965B),
        ),
        onTap: onTap,
      ),
    );
  }
}
