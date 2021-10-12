import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/data_controller.dart';
import 'package:news_app/controller/url_helper.dart';

class BusinessScreen extends StatelessWidget {
  BusinessScreen({Key? key}) : super(key: key);

  final _dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataController.getBusinessNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Obx(
          () => ListView.builder(
            itemCount: _dataController.businessNews.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  UrlHelper.openUrl(_dataController.businessNews[index]["url"]);
                },
                child: Container(
                  height: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            _dataController.businessNews[index]["urlToImage"] ?? "https://aboalishibani.com/wp-content/uploads/2014/12/default-placeholder.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _dataController.businessNews[index]["title"] ?? "Not Title Found",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _dataController.businessNews[index]["publishedAt"] ?? "published time is not found",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
