import 'package:cultive/models/user.dart';
import 'package:cultive/services/base_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { connected, not_connected, offline, unknown }

class AuthService extends BaseApiService {
  Future<User> login({String username, String password}) async {
    return await api.post('auth', data: {
      "username": username.trim(),
      "password": password.trim(),
    }).then((response) {
      saveAssinante(User.fromMap(response.data['user']));
      return User.fromMap(response.data['user']);
    }).catchError((e) {
      return null;
    });
  }

  Future<String> getIdUser() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('ID_USER') ?? '';
  }

  Future<AuthStatus> getAuthStatus() async {
    final preferences = await SharedPreferences.getInstance();
    final hasUser = (preferences.getString('ID_USER') ?? '').isNotEmpty;
    return hasUser ? AuthStatus.connected : AuthStatus.not_connected;
  }

  Future<void> saveAssinante(User user) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('ID_USER', user.id.toString());
  }

  Future clearLoggedState() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('ID_USER');
  }
}
