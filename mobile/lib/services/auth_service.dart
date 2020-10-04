import 'package:cultive/models/user.dart';
import 'package:cultive/services/base_api_service.dart';

class AuthService extends BaseApiService{
  
  Future<User> login({String username, String password}) async {
    return await api.post('auth', data: {
      "username": username,
      "password": password,
    }).then((response) => User.fromJson(response.data.user))
    .catchError((e) => null);
  }
}