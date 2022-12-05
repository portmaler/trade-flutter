import 'package:flutter/material.dart';
import '../../../main.dart';


class Reclamation extends StatelessWidget {
  Reclamation({Key? key}) : super(key: key);

  final TextEditingController sujetController = TextEditingController();
  final TextEditingController messageldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyApp.colors.goldcolor,
        elevation: 0,
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Reclamation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 150, //150
              color: MyApp.colors.goldcolor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ProfilePic(),
              SizedBox(height: size.height * .1),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: custTextField("Sujet", sujetController),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: custTextField("Message", messageldController),
              ),
              SizedBox(height: size.height * .1),
              EnvoyerButton(context, "Envoyer"),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField custTextField(String label, TextEditingController controller) {
    return TextFormField(
      autofocus: false,

      controller: controller,

      //validator () {}
      onSaved: (value) {
        controller.text = value!;
      },
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
