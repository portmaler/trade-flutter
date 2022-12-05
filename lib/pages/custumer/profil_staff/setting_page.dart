import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app1/controllers/States/language_controller.dart';
import 'package:trade_app1/controllers/States/toggle_theme_controller.dart';

import '../../../main.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  ThemeToggleController controller = Get.find();
  LanguageToggleController controller1 = Get.find<LanguageToggleController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.colors.goldcolor,
        elevation: 0,
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Body(controller, controller1),
    );
  }
}

class Body extends StatelessWidget {
  final ThemeToggleController controller;
  // final LanguageToggleController controller1;
     LanguageToggleController controller1 = Get.find<LanguageToggleController>();
  Body(this.controller, this.controller1);

  void changelanguage(String languecode) async {
    Locale locale = const Locale('ar');
    await Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            height: 150, //150
            color: MyApp.colors.goldcolor,
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ProfilePic(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: MyApp.colors.blackcolor,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/User Icon.svg",
                        color: MyApp.colors.blackcolor,
                        width: 22,
                      ),
                      SizedBox(width: 20),
                      Expanded(child: Text("Theme")),
                      GetBuilder<ThemeToggleController>(builder: (controller) {
                        return Switch.adaptive(
                            value: controller.isSavedDarkMode(),
                            onChanged: (value) {
                              controller.changeThemeMode();
                              /* Get.changeThemeMode(
                                  value ? ThemeMode.dark : ThemeMode.light);
                              controller.toggleTheme(value);*/
                            }
                            //  controller.toggleTheme(value)

                            );
                      })
                    ],
                  ),
                ),
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              GetBuilder<ThemeToggleController>(
                builder: (controller) {
                  return ProfileMenu(
                    text: "Langue",
                    icon: "assets/icons/Settings.svg",
                    press: () {
                      Get.defaultDialog(
                          title: 'Select Language',
                          middleText: 'Select your prefered languafe',
                          actions: [
                            InputChip(
                              label: const Text('English'),
                              onSelected: (v) {
                                controller1.changeLanguage('en');
                                Get.back();
                              },
                            ),
                            InputChip(
                              label: const Text('Francais'),
                              onSelected: (v) {
                                controller1.changeLanguage('fr');
                                Get.back();
                              },
                            ),
                            InputChip(
                              label: const Text('Arabe'),
                              onSelected: (v) {
                                controller1.changeLanguage('ar');
                                Get.back();
                              },
                            ),
                          ]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: MyApp.colors.blackcolor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: MyApp.colors.blackcolor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
