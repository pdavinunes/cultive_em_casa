import 'package:cultive/models/plant.dart';
import 'package:cultive/services/auth_service.dart';
import 'package:cultive/services/base_api_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class PlantService extends BaseApiService {
  Future<dynamic> storePlant(
      {PickedFile file,
      String nome,
      String userId,
      String plantId,
      String latitude,
      String longitude}) async {
    final idUser = await AuthService().getIdUser();
    FormData formData = FormData.fromMap({
      "name": nome,
      "user_id": idUser,
      "plant_id": plantId,
      "latitude": latitude,
      "longitude": longitude,
      "avatar": 'avatar1.png',
      "image": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });

    return await api.post('user-plants', data: formData).then((response) {
      return response;
    }).catchError((e) {
      return e;
    });
  }

  Future<dynamic> plantsUser() async {
    final idUser = await AuthService().getIdUser();

    return await api
        .get('user-plants/$idUser')
        .then((response) => response.data)
        .catchError((e) => print(e));
  }

  Future<List<Plant>> index() async {
    return await api
        .get('plants/')
        .then((response) =>
            response.data['plants'].map((plant) => Plant.fromMap(plant)))
        .catchError((e) => print(e));
  }

  Future<dynamic> action({String id, String action}) async {
    return await api.put('user-plants/$id/action', data: {'action': action});
  }
}
