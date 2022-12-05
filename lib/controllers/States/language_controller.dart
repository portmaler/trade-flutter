import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageToggleController extends GetxController {
  var appLocale = 'fr';

  /// Read
  Future<String> get languageSelected async {
    return await GetStorage().read('lang');
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    appLocale = await languageSelected == null ? 'fr' : await languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      saveLanguageToDisk('ar');
    } else if (type == 'en') {
      appLocale = 'en';
      saveLanguageToDisk('en');
    } else {
      appLocale = 'fr';
      saveLanguageToDisk('fr');
    }
    update();
  }

  /// Write
  void saveLanguageToDisk(String langusage) async {
    await GetStorage().write('lang', langusage);
  }
}
