import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app1/controllers/Customer/historique_paie_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/models/item_abommement.dart';
import 'package:trade_app1/models/list_item_signal.dart';
import 'package:auto_size_text/auto_size_text.dart' ;

class HistoriPaie extends StatelessWidget {
  HistoriquePController controller = Get.put(HistoriquePController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => Stack(
          children: <Widget>[
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              "Historique de paimenet",
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
                                          child: Image.asset(
                                              "assets/paiement.png"),
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
                                    child: AutoSizeText(
                                      "Un iste détaillé de tous paiement effectués depuis votre premiere inscription dans notre académie. ",
                                      style: TextStyle(
                                          color: MyApp.colors.blackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /*Expanded(
                            flex: 3,
                            child: NavBottons(size),
                          ),*/
                        ]),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: MyApp.colors.goldcolor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Text("Votre Pack d'abonnement :"),
                                      Card(
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: ListTile(
                                              title: Text(
                                                  controller
                                                      .packItem.value.title,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              subtitle: Container(
                                                child: (Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                        controller.packItem
                                                            .value.title,
                                                        style: const TextStyle(
                                                            fontSize: 13)),
                                                    Text(
                                                        controller.packItem
                                                            .value.periode,
                                                        style: const TextStyle(
                                                            fontSize: 13)),
                                                    Text(
                                                        controller
                                                            .packItem
                                                            .value
                                                            .dateinscription,
                                                        style: const TextStyle(
                                                            fontSize: 13)),
                                                  ],
                                                )),
                                              ),
                                              leading: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image.asset(
                                                    "assets/vip.png"),
                                              ),
                                            )),
                                      )
                                    ],
                                  )),
                              Expanded(
                                flex: 5,
                                child: Scrollbar(
                                  child: buildList(),
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding NavBottons(Size size) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, top: 10, right: 40.0, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
          Padding(
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
          Padding(
              padding: const EdgeInsets.all(5), child: NavBottonsItem(size)),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell NavBottonsItem(Size size) => InkWell(
        onTap: () {},
        child: Container(
          width: size.height * .4 * 3 / 14 - 10,
          height: size.height * .4 * 3 / 14,
          decoration: BoxDecoration(
            color: MyApp.colors.goldcolor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            Icons.category,
            color: MyApp.colors.greycolor,
          ),
        ),
      );

  Widget buildList() => ListView.builder(
      itemCount: controller.listSignal.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                  title: Text(controller.listSignal[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Container(
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(controller.listSignal[index].subtitle1,
                            style: const TextStyle(fontSize: 13)),
                        Text(controller.listSignal[index].subtitle2,
                            style: const TextStyle(fontSize: 13)),
                      ],
                    )),
                  ),
                  leading: Image.asset("assets/signal.png"),
                  trailing: controller.listSignal[index].icon)),
        );
      });
}
