import 'package:flutter/material.dart';

import '../models/item_abommement.dart';
import '../models/list_item_signal.dart';

class HistoriquePaieProvider {
  late List<Icon> icons;
  late List<SignalItem> signalList;
  late AbonnementItem packCard;

  HistoriquePaieProvider() {
    icons = [
      const Icon(Icons.arrow_downward_rounded, color: Colors.red, size: 35),
      const Icon(Icons.arrow_upward_rounded, color: Colors.pink, size: 35),
      const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 35)
    ];

    signalList = [
      SignalItem("Trading", "SL 11.10", "PM 10.12", icons[0]),
      SignalItem("hhading", "SL 11.10", "PM 10.12", icons[1]),
      SignalItem("Trading", "SL 11.10", "PM 10.12", icons[2]),
      SignalItem("hhading", "SL 11.10", "PM 10.12", icons[1]),
      SignalItem("Trading", "SL 11.10", "PM 10.12", icons[2])
    ];

    packCard = AbonnementItem(
        "Pack 3: VIP", "1000 dh", "vip.png", "3 Mois", "Payé le 12/02/2022");
  }

  List<Icon> getListIcons() {
    return icons;
  }

  List<SignalItem> getListSignalItem() {
    return signalList;
  }

  AbonnementItem getAbonnementItem() {
    return packCard;
  }
}
