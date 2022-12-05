import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app1/pages/Custumer/profil_staff/reclamation_page.dart';

import '../../../controllers/States/bottom_navbar_controller.dart';
import '../../../main.dart';
import '../profil_staff/edit_profil_page.dart';
import '../profil_staff/setting_page.dart';
import 'formation_categorie_page.dart';

class Profile extends StatelessWidget {
  BottomNavBarController controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.colors.goldcolor,
        elevation: 0,
        leading: MaterialButton(
          onPressed: () {
            controller.currentIndex = controller.previewsIndex;
            switch (controller.previewsIndex) {
              case 0:
                Get.to(CustomHome());
                break;
              case 1:
                //Get.to(Signaux());
                break;
              case 2:
                //Get.to(Profile());
                break;
              case 3:
                Get.to(Profile());

                break;
              default:
                break;
            }
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: bottomNavBar(size.width),
    );
  }

  Container bottomNavBar(double displayWidth) {
    return Container(
      margin: EdgeInsets.all(displayWidth * .07),
      height: displayWidth * .12,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<BottomNavBarController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            //padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, currentIndex) => InkWell(
              onTap: () {
                controller.changeIndexDirection(currentIndex);
                switch (currentIndex) {
                  case 0:
                    Get.to(CustomHome());
                    break;
                  case 1:
                    //Get.to(Signaux());
                    break;
                  case 2:
                    //Get.to(Profile());
                    break;
                  case 3:
                    Get.to(Profile());
                    break;
                  default:
                    break;
                }
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: currentIndex == controller.currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: currentIndex == controller.currentIndex
                          ? displayWidth * .12
                          : 0,
                      width: currentIndex == controller.currentIndex
                          ? displayWidth * .32
                          : 0,
                      decoration: BoxDecoration(
                        color: currentIndex == controller.currentIndex
                            ? MyApp.colors.goldcolor.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: currentIndex == controller.currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: currentIndex == controller.currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: currentIndex == controller.currentIndex
                                  ? 1
                                  : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                currentIndex == controller.currentIndex
                                    ? '${listOfStrings[currentIndex]}'
                                    : '',
                                style: TextStyle(
                                  color: MyApp.colors.goldcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: currentIndex == controller.currentIndex
                                  ? displayWidth * .03
                                  : 20,
                            ),
                            Icon(
                              listOfIcons[currentIndex],
                              size: displayWidth * .076,
                              color: currentIndex == controller.currentIndex
                                  ? MyApp.colors.goldcolor
                                  : Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.message_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Message',
    'Settings',
    'Account',
  ];
}

class Body extends StatelessWidget {
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
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {Get.to(() => EditProfilePage())},
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {
                  Get.to(() => SettingPage());
                },
              ),
              ProfileMenu(
                text: "Reclamer un problem",
                icon: "assets/icons/Bell.svg",
                press: () {
                  Get.to(() => Reclamation());
                },
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {},
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
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
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
