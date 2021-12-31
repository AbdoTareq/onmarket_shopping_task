import 'package:get/get.dart';

import 'controller/app_settings_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppSettingsController(), permanent: true).addThemeListener();
    Get.find<AppSettingsController>().addLanguageListener();
  }
}
