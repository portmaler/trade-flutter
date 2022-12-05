import 'package:get/get.dart';
import 'package:trade_app1/models/item_abommement.dart';

class AbonnementController extends GetxController {
  late List<AbonnementItem> listAbonnement;

  AbonnementController() {
    listAbonnement = [
      AbonnementItem(
          "Pack 1 : Basique", "500", "assets/basique.png", "3 Mois", ""),
      AbonnementItem(
          "Pack 2 : Standart", "500", "assets/standard.png", "3 Mois", ""),
      AbonnementItem(
          "Pack 3 : Premium", "500", "assets/premium.png", "3 Mois", ""),
      AbonnementItem("Pack 4 : VIP", "500", "assets/vip.png", "3 Mois", "")
    ].obs;
  }
}
