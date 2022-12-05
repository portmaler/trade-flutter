import 'package:flutter/material.dart';

class AbonnementItem {
  AbonnementItem(
      this.title, this.montant, this.image, this.periode, this.dateinscription);
  final String title;
  final String montant;
  final String periode;
  final String image;
  final String dateinscription;
}
