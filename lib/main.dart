import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/controller/dio_helper.dart';
import 'package:news_app/controller/theme_controller.dart';
import 'package:news_app/screens/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
      themeMode: ThemeController.themeMode,
      theme: ThemeController.light,
      darkTheme: ThemeController.dark,
    );
  }
}
