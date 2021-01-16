import 'package:cultive/models/user.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:cultive/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cultive/screens/home.dart';
import 'package:cultive/screens/user.dart';
import 'package:cultive/screens/register_plant.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Container(),
    UserScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> init() async {
    final idUser = await AuthService().getIdUser();
    UserService().getUser(idUser).then(
        (user) => Provider.of<User>(context, listen: false).setUser(user));
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
              icon: Icon(Feather.refresh_ccw),
              color: Color(0xff272727),
              onPressed: () {
                init();
              },
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
