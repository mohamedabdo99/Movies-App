import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
        dio = new Dio(
      BaseOptions(
        //https://api.themoviedb.org/3/
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
