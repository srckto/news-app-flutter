import 'package:dio/dio.dart';
import 'package:get/get.dart';

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

  static Future getData({required String url,required Map<String, dynamic> query}) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
