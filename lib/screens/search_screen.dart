import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/data_controller.dart';
import 'package:news_app/controller/url_helper.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  final _dataController = Get.put(DataController());

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: TextButton(
                    onPressed: () {
                      if (_searchController.text.trim().isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });

                        _dataController.getSearch(_searchController.text).then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      }
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _dataController.search.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            UrlHelper.openUrl(_dataController.search[index]["url"]);
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
                                      _dataController.search[index]["urlToImage"] ?? "https://aboalishibani.com/wp-content/uploads/2014/12/default-placeholder.png",
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
                                          _dataController.search[index]["title"] ?? "Not Title Found",
                                          style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          _dataController.search[index]["publishedAt"] ?? "published time is not found",
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
            ),
          ),
        ],
      ),
    );
  }
}
