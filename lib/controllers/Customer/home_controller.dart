import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  int destinationIndex = 0;

  changeIndexDirection(int indexx) {
    destinationIndex  = indexx;
    update();
  }
}
