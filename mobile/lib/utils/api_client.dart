import 'package:dio/dio.dart';
import 'package:cultive/.env.dart' as env;

class ApiClient {
  
  BaseOptions _optionsDefault = BaseOptions(
      baseUrl: env.API_URL,
      connectTimeout: 5000,
  );

  BaseOptions _options;
  BaseOptions get options => _options;

  ApiClient({ BaseOptions options }) {
    options ??= _optionsDefault;
    _options = options;
  }

  Dio get apiClient => Dio(options);
}