import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app1/controllers/Customer/home_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/pages/authentication/auth.dart';
import 'abonnement_page.dart';
import 'formation_page.dart';
import 'historique_paiement.dart';
import 'signaux_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomHome extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  var currentIndex = 0;

  CustomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyApp.colors.goldcolor,
      bottomNavigationBar: bottomNavBar(displayWidth),

      //body
      //body
      //body
      //body
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .5,
            decoration: BoxDecoration(
              color: MyApp.colors.greycolor,
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Icon(
                                Icons.logout,
                                color: MyApp.colors.goldcolor,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: displayWidth * 0.3,
                            width: displayWidth * 0.5,
                            child: Image.asset("assets/logo.png"),
                          ),
                        ),
                        Text(
                          "Bienvenue Null",
                          style: TextStyle(
                            color: MyApp.colors.goldcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Notre  est votre guide pour un bon investissement dans le monde de trading.",
                          style: TextStyle(
                            color: MyApp.colors.blackcolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
                //gridview
                //gridview
                //gridview
                //gridview
                Expanded(
                    flex: 3,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 20,
                      childAspectRatio: .85,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: <Widget>[
                        categorieCardbuild(
                          "Signaux",
                          "assets/audience.png",
                          "/signaux",
                        ),
                        categorieCardbuild(
                          "Formation",
                          "assets/learn.png",
                          "/formations",
                        ),
                        categorieCardbuild(
                          "Paiements",
                          "assets/loan.png",
                          '/hispaiement',
                        ),
                        categorieCardbuild(
                          "Abonneent",
                          "assets/abbonment.png",
                          "/abonnement",
                        ),
                      ],
                    )),
              ],
            ),
          )),
        ],
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
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        //padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.changeIndexDirection(index);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: GetBuilder<HomeController>(builder: (controller) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == controller.currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == controller.currentIndex
                        ? displayWidth * .12
                        : 0,
                    width: index == controller.currentIndex
                        ? displayWidth * .32
                        : 0,
                    decoration: BoxDecoration(
                      color: index == controller.currentIndex
                          ? MyApp.colors.goldcolor.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == controller.currentIndex
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
                            width: index == controller.currentIndex
                                ? displayWidth * .13
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == controller.currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == controller.currentIndex
                                  ? '${listOfStrings[index]}'
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
                            width: index == controller.currentIndex
                                ? displayWidth * .03
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == controller.currentIndex
                                ? MyApp.colors.goldcolor
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget categorieCardbuild(String title, String image, String rout) => InkWell(
        onTap: () {
          switch (rout) {
            case '/signaux':
              Get.to(Signaux());
              break;
            case '/formations':
              Get.to(FormationPage());
              break;
            case '/hispaiement':
              Get.to(HistoriPaie());
              break;
            case '/abonnement':
              Get.to(AbonnementPage());
              break;
            default:
              break;
          }

          // Navigator.of(context).pushNamed(rout);
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyApp.colors.greycolor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                          color: MyApp.colors.blackcolor),
                    ),
                  ),
                ),
              ],
            )),
      );

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
