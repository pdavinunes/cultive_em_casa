
import 'package:cultive/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cultive/screens/Home/home.dart';
import 'package:cultive/screens/User/user.dart';
import 'package:cultive/screens/RegisterPlant/registerPlant.dart';

class NavigationScreen extends StatefulWidget {

  final User user;

  NavigationScreen(this.user);

  @override
  _NavigationScreenState createState() => _NavigationScreenState(user);
}

class _NavigationScreenState extends State<NavigationScreen> {
  User _user;

  User get user => _user;

  _NavigationScreenState(_user);

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Container(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Início",
              style: TextStyle(
                  color: Color(0xff272727),
                  fontFamily: "OpenSans",
                  fontSize: 22)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Feather.bell),
              color: Color(0xff272727),
              onPressed: () {},
            )
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Feather.home),
                color:
                    _selectedIndex == 0 ? Color(0xff297F4E) : Color(0xff272727),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Feather.plus_square),
                color:
                    _selectedIndex == 1 ? Color(0xff297F4E) : Color(0xff272727),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPlant()))
                },
              ),
              IconButton(
                icon: Icon(Feather.user),
                color:
                    _selectedIndex == 2 ? Color(0xff297F4E) : Color(0xff272727),
                onPressed: () => _onItemTapped(2),
              ),
            ],
          ),
        ));
  }
}
