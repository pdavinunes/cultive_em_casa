import 'package:cultive/models/plant.dart';
import 'package:cultive/providers/change_provider.dart';
import 'package:cultive/screens/list_plants.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/widgets/commons/action_buttom.dart';
import 'package:cultive/widgets/plants/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> plantsPerUser;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String _timezone = 'Unknonw';

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    initPlatformState();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(25, 15, 0, 15),
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Minhas plantas",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xff266E46))),
            Expanded(
              child: Consumer<ChangeProvider>(builder: (context, __, _) {
                return Consumer<PlantService>(builder: (context, service, _) {
                  return FutureBuilder<dynamic>(
                    future: service.plantsUser(),
                    builder: (_, snapshot) {
                      final response = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          response == null) {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'lib/assets/images/404.png',
                                height: 125,
                                width: 175,
                              ),
                              Text(
                                'Sem plantas cadastras :( ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      plantsPerUser = response['plants_per_user'];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.28,
                            child: ListView.builder(
                                itemCount: plantsPerUser.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final plant =
                                      Plant.fromMap(plantsPerUser[index]);
                                  return PlantCard(plant);
                                }),
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 25),
                              child: GestureDetector(
                                onTap: () {
                                  showNotification();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => ListPlants()));
                                },
                                child: Text(
                                  "ver todas as plantas",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Color(0xff266E46),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )),
                          ActionButton(
                            inititalIndex: 1,
                            color: const Color(0xff5993C8),
                            description: 'VAMOS REGAR',
                            imageSrc: 'regar.png',
                          ),
                          ActionButton(
                            inititalIndex: 2,
                            color: const Color(0xff6ACC91),
                            description: 'VAMOS PODAR',
                            imageSrc: 'podar.png',
                          ),
                          ActionButton(
                            inititalIndex: 3,
                            color: const Color(0xffC16544),
                            description: 'VAMOS ADUBAR',
                            imageSrc: 'adubar.png',
                          ),
                        ],
                      );
                    },
                  );
                });
              }),
            ),
          ]),
    );
  }

  Future<void> initPlatformState() async {
    String timezone;
    try {
      tz.initializeTimeZones();
      timezone = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timezone));
    } on PlatformException {
      timezone = 'Failed to get the timezone.';
    }
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    // const MethodChannel platform =
    // MethodChannel('dexterx.dev/flutter_local_notifications_example');
    // var platform = new NotificationDetails(android: android, iOS: iOS);
    // await flutterLocalNotificationsPlugin.show(
    //     0, 'New Video is out', 'Flutter Local Notification', platform,
    //     payload: 'Nitish Kumar Singh is part time Youtuber');

    print('entrei');
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Regue sua planta',
        'Quer deixar ela morrer ó maluco?',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30)),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id',
                'your channel name', 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
