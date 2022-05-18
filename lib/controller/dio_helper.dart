import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class DioHelper extends GetxController {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url,required Map<String, dynamic> query}) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
