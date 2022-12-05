import 'package:flutter/material.dart';
import 'package:trade_app1/pages/authentication/auth.dart';

import 'custumer/screens/formation_categorie_page.dart';
import 'custumer/screens/formation_page.dart';
import 'custumer/screens/historique_paiement.dart';
import 'custumer/screens/signaux_page.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Authent());

      //******Custom routs ************//

      case '/customhome':
        return MaterialPageRoute(builder: (_) => CustomHome());

      case '/signaux':
        return MaterialPageRoute(builder: (_) => Signaux());

      case '/formations':
        return MaterialPageRoute(builder: (_) => const FormationPage());

      case '/hispaiement':
        return MaterialPageRoute(builder: (_) => HistoriPaie());

      //******Seller routs ************//

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
