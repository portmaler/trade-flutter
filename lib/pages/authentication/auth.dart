import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app1/main.dart';

import '../custumer/screens/formation_categorie_page.dart';

class Authent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passworldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 100),
                    custTextField("Email", emailController,
                        Icon(Icons.email, color: MyApp.colors.goldcolor)),
                    SizedBox(height: 20),
                    custTextField("Passworld", passworldController,
                        Icon(Icons.vpn_key, color: MyApp.colors.goldcolor)),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Avez vous oublié le mot de passe?",
                                style: TextStyle(
                                    color: MyApp.colors.blackcolor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(height: 35),
                    logButton(context, "S'authentifier"),
                    SizedBox(height: 40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Vous n'avez encore un compte?",
                            style: TextStyle(color: MyApp.colors.blackcolor),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "  S'inscrire",
                              style: TextStyle(
                                  color: MyApp.colors.goldcolor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Material logButton(BuildContext context, String text) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      color: MyApp.colors.goldcolor,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30, 12, 30, 18),
        onPressed: () {
          Get.to(CustomHome());
        },
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

  TextFormField custTextField(
      String label, TextEditingController controller, Icon icon) {
    return TextFormField(
      autofocus: false,
      obscureText: true,
      controller: controller,

      //validator () {}
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: icon,
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
