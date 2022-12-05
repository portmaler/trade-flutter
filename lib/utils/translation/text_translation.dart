import 'package:get/get.dart';

import 'ar_ma.dart';
import 'en_us.dart';
import 'fr_fr.dart';

class TextTranslation extends Translations {


  @override
  Map<String, Map<String, String>> get keys => {
    'en' : EnUs.map,
    'fr' : FrFr.map,
    'ar' : ArMa.map,

  };

}