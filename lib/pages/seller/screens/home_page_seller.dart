import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app1/controllers/States/bottom_navbar_controller.dart';
import 'package:trade_app1/controllers/Seller/buttom_navbar_seller_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/pages/custumer/screens/profil_page2.dart';
import 'package:trade_app1/pages/seller/screens/membre_list_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'abonnement_seller_page.dart';
import 'signaux_seller_page.dart';

class SellerHome extends StatelessWidget {
  BottomNavBarSellerController controller =
      Get.put(BottomNavBarSellerController());

  SellerHome({Key? key}) : super(key: key);

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
            height: size.height * .3,
            decoration: BoxDecoration(
              color: MyApp.colors.greycolor,
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              height: displayWidth * 0.2,
              width: displayWidth * 0.2,
              child: Image.asset("assets/logo.png"),
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
                                Get.to(() => SellerHome());
                              },
                              child: Icon(
                                Icons.logout,
                                color: MyApp.colors.goldcolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          " Bienvenue Admin Anas",
                          style: TextStyle(
                            color: MyApp.colors.goldcolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                      ]),
                ),

                Expanded(
                  flex: 7,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: .95,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      categorieCardbuild(
                        size,
                        "Signaux",
                        "assets/audience.png",
                        "/signaux",
                      ),
                      categorieCardbuild(
                        size,
                        "Membres",
                        "assets/abbonment.png",
                        "/membres",
                      ),
                      categorieCardbuild(
                        size,
                        "Paiements",
                        "assets/loan.png",
                        '/hispaiement',
                      ),
                      categorieCardbuild(
                        size,
                        "Abonnement",
                        "assets/loan.png",
                        '/abonnement',
                      ),
                      categorieCardbuild(
                        size,
                        "Formation",
                        "assets/learn.png",
                        "/formations",
                      ),
                      categorieCardbuild(
                        size,
                        "Meets",
                        "assets/abbonment.png",
                        "/abonnement",
                      ),
                    ],
                  ),
                )
                //gridview
                //gridview
                //gridview
                //gridview
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
      child: GetBuilder<BottomNavBarController>(builder: (controller) {
        return ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          //padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.previewsIndex = controller.currentIndex;
              controller.changeIndexDirection(index);
              switch (index) {
                case 0:
                  // Get.to(CustomHome());

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
            ),
          ),
        );
      }),
    );
  }

  Widget categorieCardbuild(
          Size size, String title, String image, String rout) =>
      InkWell(
        onTap: () {
          switch (rout) {
            case '/signaux':
              Get.to(SignauxSeller());
              break;
            case '/membres':
              Get.to(MembresPage());
              break;
            case '/hispaiement':
              //Get.to(HistoriPaie());
              break;
            case '/formations':
              //Get.to(FormationPage());
              break;
            case '/hispaiement':
              //Get.to(HistoriPaie());
              break;
            case '/abonnement':
              Get.to(AbonnementSellerPage());
              break;
            default:
              break;
          }

          // Navigator.of(context).pushNamed(rout);
        },
        child: Container(
            height: size.height * .1,
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
