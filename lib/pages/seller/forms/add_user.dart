import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app1/main.dart';

class UserForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  int _selectedType = 0;
  int _selectedAction = 0;

  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  String _password = '';
  bool _termsChecked = true;

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
    loadTypeList();
    loadActionList();
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: size.width / 1.2,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(.3),
              ),
              child: DropdownButton(
                hint: const Text(
                  'Select Gender',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                items: typeList,
                value: _selectedType,
                isExpanded: true,
                onChanged: (value) {},
                //isExpanded: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TP",
                  style: TextStyle(fontSize: 25),
                ),
                getTextField(hint: 'Tp', size: size),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SB",
                  style: TextStyle(fontSize: 25),
                ),
                getTextField(hint: 'SB', size: size),
              ],
            ),
            Container(
              width: size.width / 1.2,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(.3),
              ),
              child: DropdownButton(
                hint: const Text(
                  'Select Action',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                items: actionList,
                value: _selectedAction,
                isExpanded: true,
                onChanged: (value) {},
                //isExpanded: true,
              ),
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

  List<Widget> getFormWidget(BuildContext context) {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    ));

    validateEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter mail';
      }

      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern.toString());
      if (!regex.hasMatch(value.toString())) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {},
    ));

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter age';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    ));

    formWidget.add(DropdownButton(
      hint: const Text('Select Gender'),
      items: typeList,
      value: _selectedType,
      onChanged: (value) {},
      isExpanded: true,
    ));

    formWidget.add(Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {},
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {},
        ),
      ],
    ));

    formWidget.add(
      TextFormField(
          key: _passKey,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Password', labelText: 'Enter Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter password';
            } else if (value.length < 8) {
              return 'Password should be more than 8 characters';
            } else {
              return null;
            }
          }),
    );

    formWidget.add(
      TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (confirmPassword) {
            if (confirmPassword != null && confirmPassword.isEmpty) {
              return 'Enter confirm password';
            }
            var password = _passKey.currentState?.value;
            if (confirmPassword != null &&
                confirmPassword.compareTo(password) != 0) {
              return 'Password mismatch';
            } else {
              return null;
            }
          },
          onSaved: (value) {}),
    );

    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {},
      subtitle: !_termsChecked
          ? const Text(
              'Required',
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            )
          : null,
      title: const Text(
        'I agree to the terms and condition',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate() && _termsChecked) {
        _formKey.currentState?.save();

        print("Name " + _name);
        print("Email " + _email);
        print("Age " + _age.toString());
        switch (_selectedType) {
          case 0:
            print("Gender Male");
            break;
          case 1:
            print("Gender Female");
            break;
          case 3:
            print("Gender Others");
            break;
        }
        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Form Submitted')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Sign Up'), onPressed: onPressedSubmit));

    return formWidget;
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
              icon: Icon(Icons.lock),
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: "Password"),
        ),
      ),
    );
  }
}
