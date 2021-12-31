import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onmarket_shopping_task/view/pages/HomePage.dart';

import 'export.dart';
import 'utils/langs/my_translation.dart';

Future<void> main() async {
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ar_app_name.tr,
      translations: MyTranslation(),
      locale: Get.deviceLocale,
      // defaultTransition: Transition.leftToRight,
      initialBinding: AppBinding(),
      home: HomePage(),
    );
  }
}
