import 'package:cultive/widgets/utils/MyBehavior.dart';
import 'package:flutter/material.dart';
import 'package:cultive/screens/Login/login.dart';
import 'package:cultive/widgets/utils/CustomColor.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void _enableRotation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _enableRotation();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CompanyColors.green, fontFamily: 'Montserrat'),
      home: LoginScreen(),
      builder: (context, child) {
        return ScrollConfiguration(behavior: MyBehavior(), child: child);
      },
    );
  }
}
