import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trade_app1/controllers/Seller/user_seller_controller.dart';
import 'package:trade_app1/main.dart';
import 'package:trade_app1/pages/seller/forms/add_user.dart';

class MembresPage extends StatelessWidget {
  MembresPage({Key? key}) : super(key: key);

  UserSellerController controller = Get.put(UserSellerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyApp.colors.greycolor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showBarModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Colors.white,
                child: UserForm(),
              ),
            );
          },
          label: const Text('Add Signal'),
          icon: const Icon(Icons.add),
          backgroundColor: MyApp.colors.bluecolor,
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text("Membres"),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(),
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
        ));
  }

  Widget buildList(Size size) => ListView.builder(
      itemCount: controller.listUser.length,
      itemBuilder: (context, index) {
        return cardItem(controller, index);
      });

  Card cardItem(UserSellerController controller, int index) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
          padding: EdgeInsets.all(15),
          child: ListTile(
            title: Text(controller.listUser[index].nom,
                style: TextStyle(
                    fontSize: 20,
                    color: MyApp.colors.bluecolortext,
                    fontWeight: FontWeight.w500)),
            subtitle: Container(
              child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(controller.listUser[index].email,
                      style: TextStyle(fontSize: 13)),
                  Text(controller.listUser[index].tel,
                      style: TextStyle(fontSize: 13)),
                ],
              )),
            ),
            trailing: Wrap(
              spacing: 10, // space between two icons
              children: <Widget>[
                IconButton(
                  onPressed: () async {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () async {},
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
            leading: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.grey))),
              child: Image.asset(controller.listUser[index].imageUrl),
            ),
          )),
    );
  }
}
