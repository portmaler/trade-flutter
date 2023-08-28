import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trade_app1/controllers/States/authentification_controoler.dart';
import 'package:trade_app1/controllers/States/language_controller.dart';
import 'package:trade_app1/pages/authentication/auth.dart';
import 'package:trade_app1/utils/helpers/bindinggetx.dart';
import 'package:trade_app1/utils/theme/themes.dart';

import 'controllers/States/toggle_theme_controller.dart';
import 'pages/custumer/screens/home_page.dart';
import 'utils/translation/text_translation.dart';

void main() async {
  //initialise getStorage
  await GetStorage.init();
  // orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  Get.put<LanguageToggleController>(LanguageToggleController());
   Get.put<AuthenticationController>(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const colors = AppColors();

  @override
  Widget build(BuildContext context) {
    ThemeToggleController controller = Get.put(ThemeToggleController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      //language settings
      locale: const Locale('fr'),
      fallbackLocale: const Locale('fr'),
      translations: TextTranslation(),

      //them settings
      themeMode: controller.getThemeMode(),
      theme: MyThemes.lightThem,
      darkTheme: MyThemes.darkTheme,

      // initialBinding: AppBinding(),
      home: Authent(),
      //home: CustomHome(),
    );
  }
}

class AppColors {
  final goldcolor = const Color(0xFFFFC23B);
  //final greycolor = const Color(0xFFf1f2f6);
  final blackcolor = const Color(0xFF1e1e1e);

  // final goldcolor = const Color(0xFFf5cb5c);
  final greycolor = const Color(0xFFf1f2f6);
  final greyfoncedcolor = const Color.fromARGB(255, 240, 211, 154);
  //final blackcolor = const Color(0xFF1e1e1e);
  final bluecolortext = const Color(0xFF13315c);
  final bluecolor = const Color(0xFF2ec4b6);

  const AppColors();
}
