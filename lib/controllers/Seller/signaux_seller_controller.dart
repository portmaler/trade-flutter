import 'package:get/get.dart';

import '../../providers/signaux_provider.dart';

class SignauxSellerController extends GetxController {
  bool listItemisClicked = false;
  int listItemClickedIndex = 0;

  late SignauxProvider provider;
  late var listIcons = provider.getListIcons().obs;
  late var listSignal = provider.getListSignalItem().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider = SignauxProvider();
  }

  void changeItemClickedState(bool val, int index) {
    listItemClickedIndex == index
        ? listItemisClicked = val
        : listItemisClicked = !val;

    listItemClickedIndex = index;

    update();
  }
}
