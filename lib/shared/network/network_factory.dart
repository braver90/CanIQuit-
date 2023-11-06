import 'package:dio/dio.dart';

class NetworkFactory {
  static getDefaultClient() {
    Dio http = Dio();
    return http;
  }
}
