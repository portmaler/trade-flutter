import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app1/controllers/States/bottom_navbar_controller.dart';
import 'package:trade_app1/main.dart';
import 'home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  BottomNavBarController controller = Get.put(BottomNavBarController());
  List<dynamic> _docIDS = [];

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: bottomNavBar(size.width),
      appBar: AppBar(
        backgroundColor: MyApp.colors.goldcolor,
        leading: SizedBox(),
        // On Android it's false by default
        centerTitle: true,
        title: const Text("Profile"),
        elevation: 0,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, //16
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: 240, // 240
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 150, //150
                color: MyApp.colors.goldcolor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10), //10
                    height: 140, //140
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 8, //8
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/profil.jpeg"),
                      ),
                    ),
                  ),

                  /*StreamBuilder(
                    stream: getProfileInfo(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        log(snapshot.error.toString());
                      }

                      var data = snapshot.data;
                      if (data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return setDataTofieldtext(data);
                    },
                  ),*/

                  const SizedBox(height: 5), //5
                  Text(
                    "user.email!",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8492A2),
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding profileMenuitem(String icon){
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
        onPressed: (){},
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: MyApp.colors.blackcolor,
              width: 22,
            ),
              
            SizedBox(width: 20),
            Expanded(child: Text('text')),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
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
                    //Get.to(Profile());
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
