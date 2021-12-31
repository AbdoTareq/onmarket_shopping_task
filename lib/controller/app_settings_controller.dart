import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class AppSettingsController extends GetxController {
  final darkMode = true.obs;
  final lang = true.obs;
  final box = GetStorage();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final lightTheme = ThemeData(
    primarySwatch: kPrimaryColor,
    // primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: 'Cairo',
  );

  final darkTheme = ThemeData(
    primarySwatch: kPrimaryColor,
    primaryColor: kPrimaryColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: 'Cairo',
  );

  openDrawer() => scaffoldKey.currentState?.openDrawer();

  @override
  void onInit() {
    super.onInit();
    darkMode(box.read('dark') ?? true);
    lang(box.read('language') ?? true);
    log('${lang(box.read('language') ?? true)}');
    Get.changeTheme(darkMode.value ? darkTheme : lightTheme);
  }

  void addThemeListener() {
    box.listenKey('dark', (value) {
      Get.changeTheme(value ? darkTheme : lightTheme);
    });
  }

  void addLanguageListener() {
    box.listenKey('language', (value) {
      Get.updateLocale(!value ? Locale('en', 'US') : Locale('ar', 'EG'));
    });
  }
}
