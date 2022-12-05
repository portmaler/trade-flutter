import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app1/main.dart';

class AbonnementForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  List<DropdownMenuItem<int>> typeList = [];
  List<DropdownMenuItem<int>> actionList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nome de Pack",
                  style: TextStyle(fontSize: 15),
                ),
                getTextField(hint: 'Nome de Pack', size: size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duree",
                  style: TextStyle(fontSize: 15),
                ),
                getTextField(hint: 'Duree', size: size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix",
                  style: TextStyle(fontSize: 15),
                ),
                getTextField(hint: 'Prix', size: size),
              ],
            ),
            EnvoyerButton(context, "Ajouter"),
          ]),
        ));
  }

  Material EnvoyerButton(BuildContext context, String text) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      color: MyApp.colors.goldcolor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30, 12, 30, 18),
        onPressed: () {},
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getTextField({required String hint, required Size size}) {
    return Container(
      width: size.width / 2,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: hint),
        ),
      ),
    );
  }
}
