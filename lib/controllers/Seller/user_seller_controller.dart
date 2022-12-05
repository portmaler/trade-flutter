import 'package:get/get.dart';

import '../../providers/user_provider.dart';

class UserSellerController extends GetxController{
  late UserProvider provider;
  late var listUser = provider.getListUser().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider = UserProvider();
  }
}