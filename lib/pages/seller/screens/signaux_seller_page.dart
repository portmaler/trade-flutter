import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:trade_app1/controllers/Seller/signaux_seller_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/models/list_item_signal.dart';
import 'package:trade_app1/utils/helpers/herotesthh.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:trade_app1/pages/seller/forms/add_signal.dart';

class SignauxSeller extends StatelessWidget {
  SignauxSellerController controller = Get.put(SignauxSellerController());

  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyApp.colors.greycolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Get.to(AddTodoPopupCard());
          openDialog(context, size);
          /* showBottomSheet(
            context: context,
            builder: (context) => Container(
              color: Colors.white,
              child: SignalForm(textcontroller),
            ),
          );*/
        },
        label: const Text('Add Signal'),
        icon: const Icon(Icons.add),
        backgroundColor: MyApp.colors.bluecolor,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * .4,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
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
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: size.width * .7,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0,
                                              top: 10.0,
                                              right: 40.0,
                                              bottom: 10.0),
                                          child: AutoSizeText(
                                            "Signaux",
                                            style: TextStyle(
                                                color: MyApp.colors.goldcolor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 50),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/signal.png"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: buildEmailFormField(textcontroller),
                                /*child: AutoSizeText(
                                    "Decouvrir les derniers sighaux ajoute de trading et forex",
                                    style: TextStyle(
                                        color: MyApp.colors.blackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 100),
                                  ),*/
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: NavBottons(size),
                        ),
                      ]),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyApp.colors.goldcolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Obx(
                        () => Scrollbar(
                          child: buildList(size),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

  Widget buildList(Size size) => ListView.builder(
      itemCount: controller.listSignal.length,
      itemBuilder: (context, index) {
        return GetBuilder<SignauxSellerController>(
          builder: (controller) => GestureDetector(
            onTap: () {
              controller.changeItemClickedState(
                  !controller.listItemisClicked, index);
            },
            child: (controller.listItemisClicked &&
                    controller.listItemClickedIndex == index)
                ? cardItemOnTap(context, controller, index, size)
                : cardItem(controller, index),
          ),
        );
      });

  Card cardItem(SignauxSellerController controller, int index) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
          padding: EdgeInsets.all(15),
          child: ListTile(
              title: Text(controller.listSignal[index].title,
                  style: TextStyle(
                      fontSize: 20,
                      color: MyApp.colors.bluecolortext,
                      fontWeight: FontWeight.w500)),
              subtitle: Container(
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(controller.listSignal[index].subtitle1,
                        style: TextStyle(fontSize: 13)),
                    Text(controller.listSignal[index].subtitle2,
                        style: TextStyle(fontSize: 13)),
                  ],
                )),
              ),
              leading: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey))),
                child: Image.asset("assets/signal.png"),
              ),
              trailing: controller.listSignal[index].icon)),
    );
  }

  Card cardItemOnTap(BuildContext context, SignauxSellerController controller,
      int indexSize, Size size) {
    return Card(
        elevation: 8.0,
        color: Color.fromARGB(255, 144, 218, 220),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 100, right: 15, top: 15, bottom: 15),
          child: ListTile(
            title: Text("",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            subtitle: Container(
              child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("", style: TextStyle(fontSize: 13)),
                  Text("", style: TextStyle(fontSize: 13)),
                ],
              )),
            ),
            leading: Text(
              "Partager",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    child: SignalForm(),
                  ),
                );
              },
              child: Icon(
                Icons.share,
                size: 35,
                color: MyApp.colors.blackcolor,
              ),
            ),
          ),
        ));
  }

  Container bottomSheetShare(Size size, BuildContext context) {
    return Container(
      height: size.height,
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(hintText: "fdeev"),
      ),
    );
  }

  bottomSheetAdd(Size size) {}

  Widget getTextField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            //    borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            //  borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          //contentPadding:
          //     EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          filled: true,
          //   fillColor: Color(Colors.accents),
          hintText: hint,
          hintStyle: TextStyle(
            //    fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          )),
    );
  }

  TextFormField buildEmailFormField(TextEditingController textcontroller) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        textcontroller.text = newValue!;
      },
      onChanged: (value) {},
      validator: (value) {},
      controller: textcontroller,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Future openDialog(BuildContext context, Size size) => showDialog(
        context: context,
        builder: (context) => SizedBox(
          height: size.height * .6,
          child: AlertDialog(
            title: Text("Ajouter Signal"),
            content: SignalForm(),
            /*Column(
              children: [
               SizedBox(
                  height: 15,
                ),
                custTextField("dgtetgt"),
                SizedBox(
                  height: 15,
                ),
                custTextField("TP"),
                SizedBox(
                  height: 15,
                ),
                custTextField("SB"),
              ],
            ),*/
            actions: [],
          ),
        ),
      );

  TextFormField custTextField(String label) {
    return TextFormField(
      autofocus: false,

      //validator () {}
      onSaved: (value) {},
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: label,
        labelStyle: TextStyle(
          color: MyApp.colors.goldcolor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyApp.colors.goldcolor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyApp.colors.goldcolor, width: 2),
        ),
      ),
    );
  }
}
