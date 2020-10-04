import 'package:dio/dio.dart';

class ApiClient {
  
  BaseOptions _optionsDefault = BaseOptions(
      baseUrl: "http://10.0.2.2:3333/",
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