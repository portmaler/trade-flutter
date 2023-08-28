import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  bool isAdminChecked = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void changeState(bool value) {
    isAdminChecked = value;
    update();
  }

}
