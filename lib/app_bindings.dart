import 'package:get/get.dart';
import 'package:onmarket_shopping_task/controller/top_rated_controller.dart';
import 'package:onmarket_shopping_task/repos/product_repo.dart';

import 'controller/app_settings_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppSettingsController(), permanent: true).addThemeListener();
    Get.find<AppSettingsController>().addLanguageListener();
    Get.lazyPut<TopRatedController>(() => TopRatedController(ProductsManager()));
  }
}
