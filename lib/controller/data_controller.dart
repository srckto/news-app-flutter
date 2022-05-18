import 'package:get/get.dart';
import 'package:news_app/controller/dio_helper.dart';

class DataController extends GetxController {
  RxList<dynamic> appleNews = [].obs;
  RxList<dynamic> teslaNews = [].obs;
  RxList<dynamic> businessNews = [].obs;
  RxList<dynamic> search = [].obs;

  @override
  void onInit() {
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
    super.onInit();
  }



  Future getAppleNews() async {
    List<dynamic> responseData = [];

    await DioHelper.getData(url: "v2/everything", query: {
      "q": "apple",
      "from": "2022-05-17",
      "to": "2022-05-17",
      "sortBy": "popularity",
      "apiKey": "442cd1c762ba49cda0db56907b079af9",
    }).then((value) {
      responseData = value.data["articles"] as List<dynamic>;
    });

    return appleNews.value = responseData;
  }

  Future getTeslaNews() async {
    List<dynamic> responseData = [];

    await DioHelper.getData(url: "v2/everything", query: {
      "q": "tesla",
      "from": "2022-04-18",
      "sortBy": "publishedAt",
      "apiKey": "442cd1c762ba49cda0db56907b079af9",
    }).then((value) {
      responseData = value.data["articles"] as List<dynamic>;
    });

    return teslaNews.value = responseData;
  }

  Future getBusinessNews() async {
    List<dynamic> responseData = [];

    await DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "us",
      "category": "business",
      "apiKey": "442cd1c762ba49cda0db56907b079af9",
    }).then((value) {
      responseData = value.data["articles"] as List<dynamic>;
    });

    return businessNews.value = responseData;
  }

  Future getSearch(String value) async {
    List<dynamic> responseData = [];

    await DioHelper.getData(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "442cd1c762ba49cda0db56907b079af9",
    }).then((value) {
      responseData = value.data["articles"] as List<dynamic>;
    });

    return search.value = responseData;
  }
}
