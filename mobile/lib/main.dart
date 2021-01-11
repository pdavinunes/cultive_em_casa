import 'package:cultive/providers/change_provider.dart';
import 'package:cultive/screens/navigation.dart';
import 'package:cultive/screens/offline.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:cultive/services/user_service.dart';
import 'package:cultive/widgets/commons/my_behavior.dart';
import 'package:flutter/material.dart';
import 'package:cultive/screens/login.dart';
import 'package:cultive/widgets/commons/custom_color.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void _enableRotation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _enableRotation();

    return MultiProvider(
      providers: [
        Provider<User>.value(value: User()),
        ChangeNotifierProvider.value(value: ChangeProvider()),
        Provider<PlantService>(
          create: (context) => PlantService(),
        ),
        Provider<UserService>(
          create: (context) => UserService(),
        )
      ],
      child: MaterialApp(
        title: 'Cultive em Casa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: CompanyColors.green, fontFamily: 'Montserrat'),
        home: FutureBuilder<AuthStatus>(
          future: AuthService().getAuthStatus(),
          builder: (_, statusSnap) {
            final status = ConnectionState.done != statusSnap.connectionState
                ? AuthStatus.unknown
                : (statusSnap.data ?? AuthStatus.unknown);

            switch (status) {
              case AuthStatus.connected:
                return NavigationScreen();
                break;
              case AuthStatus.not_connected:
                return LoginScreen();
                break;
              case AuthStatus.offline:
                return OfflineScreen();
                break;
              case AuthStatus.unknown:
                return const Scaffold();
                break;
              default:
                return const Scaffold();
                break;
            }
          },
        ),
        builder: (context, child) {
          return ScrollConfiguration(behavior: MyBehavior(), child: child);
        },
      ),
    );
  }
}
