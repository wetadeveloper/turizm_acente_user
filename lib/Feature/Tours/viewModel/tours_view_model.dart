import 'package:flutter/material.dart';

class TurViewModel extends ChangeNotifier {
  Map<String, String> turKoleksiyonIsimleri = {
    'populer_turlar': 'Populer Turlar',
    'avrupa_turlari': 'Avrupa Turları',
    'deniz_tatilleri': 'Deniz Tatilleri',
    'karadeniz_turlari': 'Karadeniz Turları',
    'anadolu_turlari': 'Anadolu Turları',
    'hac_umre_turlari': 'Hac&Umre Turları',
    'gastronomi_turlari': 'Gastronomi Turları',
    'yatvetekne_turlari': 'Yat & Tekne Turları',
    'saglik_turlari': 'Sağlık Turları'
  };

  // Bu metodla dışarıdan veriye erişim sağlayabilirsiniz
  String? getTurIsmi(String key) {
    return turKoleksiyonIsimleri[key];
  }
}
