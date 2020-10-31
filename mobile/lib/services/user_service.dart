import 'package:cultive/models/user.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:cultive/services/base_api_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UserService extends BaseApiService{
  
  Future<User> login({
    PickedFile file,
    String nome, 
    String username, 
    String email, 
    String password}) async {

     FormData formData = FormData.fromMap({
    "name": nome,
    "username": username,
    "email": email,
    "password": password,
    "image": await MultipartFile.fromFile(file.path ,filename: file.path.split('/').last),
});
    return await api.post('users', data: formData).then((response) {
      AuthService().saveAssinante(User.fromMap(response.data['user']));
      return User.fromMap(response.data['user']);
    })
    .catchError((e) => null);
  }

  Future<User> getUser(String id) async {
    return await api.get('users/$id')
    .then((response) { 
      return User.fromMap(response.data['message'] ); })
    .catchError((e) => print(e));
  }
}