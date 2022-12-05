import 'package:flutter/material.dart';
import 'package:trade_app1/models/user.dart';
import '../models/list_item_signal.dart';

class UserProvider {
  late List<User> userList;

  UserProvider() {
    userList = [
      User("assets/images/Profile Image.png", "Ayoub", "rtytny",
          "rtrtg@evfe.com", "07070707", "1000"),
      User("assets/images/Profile Image.png", "Youssef", "rgfdtny",
          "rgddtg@evfe.com", "0788707", "1500"),
      User("assets/images/Profile Image.png", "Anas", "rtytny",
          "rtrtg@evume.com", "070754407", "2000"),
      User("assets/images/Profile Image.png", "Samir", "rtytny",
          "rtrtg@eytue.com", "054540707", "1000"),
      User("assets/images/Profile Image.png", "Yassir", "rtytny",
          "rtrtg@etyue.com", "075360707", "1500"),
    ];
  }

  List<User> getListUser() {
    return userList;
  }
}
