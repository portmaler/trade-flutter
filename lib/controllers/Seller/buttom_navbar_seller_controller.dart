import 'package:get/get.dart';

class BottomNavBarSellerController extends GetxController {
  int currentIndex = 0;
  int previewsIndex = 0;

  changeIndexDirection(int indexx) {
    currentIndex = indexx;
    update();
  }
}
