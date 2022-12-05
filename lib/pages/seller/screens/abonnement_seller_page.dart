import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trade_app1/controllers/Customer/abonnement_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/models/item_abommement.dart';

import '../forms/add_pack.dart';


class AbonnementSellerPage extends StatelessWidget {
  AbonnementSellerPage({Key? key}) : super(key: key);

  AbonnementController controller = Get.put(AbonnementController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => Container(
              color: Colors.white,
              child: AbonnementForm(),
            ),
          );
        },
        label: const Text('Add Pack'),
        icon: const Icon(Icons.add),
        backgroundColor: MyApp.colors.bluecolor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: MyApp.colors.goldcolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0,
                                        top: 10.0,
                                        right: 40.0,
                                        bottom: 20.0),
                                    child: AutoSizeText(
                                      "Liste des abonnements",
                                      style: TextStyle(
                                          color: MyApp.colors.goldcolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 60),
                                    ),
                                  )),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.asset("assets/paiement.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0,
                                top: 10.0,
                                right: 20.0,
                                bottom: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*Expanded(
                            flex: 3,
                            child: NavBottons(size),
                          ),*/
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: MyApp.colors.goldcolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Obx(
                () => CarouselSlider(
                  items: controller.listAbonnement
                      .map(
                        (item) => slideItem(size, item),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: size.height * .5,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Container slideItem(Size size, AbonnementItem abonItem) {
    return Container(
      //width: size.width * 0.7,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                onPressed: () {
                  //  Get.to(() => SellerHome());
                },
                child: Icon(
                  Icons.edit,
                  color: MyApp.colors.blackcolor,
                  size: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 6,
                  child: Image.asset(abonItem.image),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: size.width * .5,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        abonItem.title,
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: MyApp.colors.goldcolor,
                          ),
                          Text(
                            abonItem.periode,
                            style: TextStyle(
                                color: MyApp.colors.goldcolor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("Voir les \n services"),
                          Icon(
                            Icons.play_arrow,
                            color: MyApp.colors.goldcolor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
