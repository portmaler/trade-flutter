import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app1/main.dart';

class SignalForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  TextEditingController tpController = TextEditingController();
  TextEditingController sbController = TextEditingController();

  int _selectedType = 0;
  int _selectedAction = 0;



  List<DropdownMenuItem<int>> typeList = [];
  List<DropdownMenuItem<int>> actionList = [];

  void loadTypeList() {
    typeList = [];
    typeList.add(const DropdownMenuItem(
      child: Text('Trade'),
      value: 0,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Forex'),
      value: 1,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Gold'),
      value: 2,
    ));
  }

  void loadActionList() {
    typeList = [];
    typeList.add(const DropdownMenuItem(
      child: Text('Buy'),
      value: 0,
    ));
    typeList.add(const DropdownMenuItem(
      child: Text('Sell'),
      value: 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int? _selectedType = 0;
    loadTypeList();
    loadActionList();
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * .4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dropdownitem("Type", size, _selectedType),
                    SizedBox(
                      height: 10,
                    ),
                    custTextField("TP"),
                    SizedBox(
                      height: 10,
                    ),
                    custTextField("SB"),
                    SizedBox(
                      height: 10,
                    ),
                    dropdownitem("Action", size, _selectedType),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: EnvoyerButton(context, "Ajouter")),
                  ]),
            ),
          ),
        ));
  }

  Container dropdownitem(String hint, Size size, int _selectedType) {
    return Container(
      width: size.width * 0.9,

      //margin: EdgeInsets.only(top: 30),
      /* decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(.3),
      ),*/
      child: DropdownButton(
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        items: typeList,
        // value: _selectedType,
        isExpanded: true,
        onChanged: (value) {
          // _selectedType = value as int?;
        },
        //isExpanded: true,
      ),
    );
  }

  TextFormField custTextField(String label) {
    return TextFormField(
      autofocus: false,

      //validator () {}
      onSaved: (value) {},
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
        padding: EdgeInsets.fromLTRB(20, 5, 20, 7),
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
