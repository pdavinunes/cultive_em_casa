import 'package:cultive/utils/api_client.dart';
import 'package:dio/dio.dart';

class BaseApiService {
  BaseApiService({ApiClient api}) {
    api ??= ApiClient();
    _api = api;
  }

  ApiClient _api;
  
  Dio get api => _api.apiClient;

  String getImage(String image) {
    return _api.options.baseUrl+image;
  }
}
