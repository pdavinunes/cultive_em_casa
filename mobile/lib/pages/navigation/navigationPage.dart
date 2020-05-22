import 'package:cultive_em_casa_app/pages/home/homePage.dart';
import 'package:cultive_em_casa_app/pages/plants/plantsPage.dart';
import 'package:cultive_em_casa_app/pages/user/userPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedTab = 0;

  final _pageOptions = [HomePage(), PlantsPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff55e890),
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/home.svg',
                height: 25,
                color: _selectedTab == 0 ? Color(0xff75E8A3) : Colors.grey,
              ),
              title: Container(
                margin: EdgeInsets.only(top : 5),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: _selectedTab == 0
                        ? Color(0xff75E8A3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/plant.svg',
                height: 28,
                color: _selectedTab == 1 ? Color(0xff75E8A3) : Colors.grey,
              ),
              title: Container(
                margin: EdgeInsets.only(top : 5),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: _selectedTab == 1
                        ? Color(0xff75E8A3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
              )),
          BottomNavigationBarItem(
              icon: Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: _selectedTab == 2 ? Color(0xff55e890) : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(180.0))),
                child: ClipOval(
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Container(
                margin: EdgeInsets.only(top : 5),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: _selectedTab == 2
                        ? Color(0xff75E8A3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
              ))
        ],
      ),
    );
  }
}
