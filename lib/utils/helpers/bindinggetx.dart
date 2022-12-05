import 'package:get/get.dart';
import 'package:trade_app1/controllers/States/language_controller.dart';

class AppBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageToggleController());
  }
}
