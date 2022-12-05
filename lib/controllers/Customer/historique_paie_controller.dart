import 'package:get/get.dart';
import 'package:trade_app1/models/item_abommement.dart';
import 'package:trade_app1/providers/historique_paie_provide.dart';

class HistoriquePController extends GetxController {
  late HistoriquePaieProvider provider;
  late var listIcons = provider.getListIcons().obs;
  late var listSignal = provider.getListSignalItem().obs;
  late  Rx<AbonnementItem> packItem = provider.getAbonnementItem().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provider = HistoriquePaieProvider();
  }
}
