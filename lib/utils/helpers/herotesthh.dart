import 'package:flutter/material.dart';

import '../../main.dart';

class AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "jggg",
          child: Material(
            color: Colors.grey.shade100,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /* const TextField(
                      decoration: InputDecoration(
                        hintText: 'New todo',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),*/

                    custTextField("nom"),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    custTextField("nom"),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    custTextField("nom"),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    custTextField("nom"),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
