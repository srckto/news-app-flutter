import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/apple_screen.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/tesla_screen.dart';

class BottomNavicationController extends GetxController {
  RxInt currentIndex = 0.obs;

  final pages = [
    AppleScreen(),
    TeslaScreen(),
    BusinessScreen(),
  ];

  final title = [
    "Apple News",
    "Tesla News",
    "Business News",
  ];

  void onChange(int newIntValue) {
    currentIndex.value = newIntValue;
  }

  final bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "Apple",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.import_contacts),
      label: "Tesla",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business ",
    ),
  ];
}
