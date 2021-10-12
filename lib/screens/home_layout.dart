import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/bottom_navication_controller.dart';
import 'package:news_app/controller/theme_controller.dart';
import 'package:news_app/screens/search_screen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  final _bottomController = Get.put(BottomNavicationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(_bottomController.title[_bottomController.currentIndex.value]),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => SearchScreen()),
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {

                ThemeController.changeThemeMode();
              },
              icon: Icon(
                Icons.brightness_4_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: _bottomController.pages[_bottomController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomController.currentIndex.value,
          onTap: _bottomController.onChange,
          items: _bottomController.bottomItem,
        ),
      ),
    );
  }
}
