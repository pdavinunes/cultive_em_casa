import 'package:cultive_em_casa_app/models/user.dart';
import 'package:cultive_em_casa_app/pages/login/loginPage.dart';
import 'package:cultive_em_casa_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: LoginApp(),
        color: Colors.grey,
        theme: ThemeData(fontFamily: 'OpenSans'),
      ),
    );
  }
}

