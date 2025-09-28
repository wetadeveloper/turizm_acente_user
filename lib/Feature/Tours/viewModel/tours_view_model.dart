import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamet/Feature/Tours/model/tours_model.dart';

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

  final Map<String, String> currencySymbols = {
    "Dolar": "\$",
    "Türk Lirası": "₺",
    "Euro": "€",
  };

  String getIkiliOdaFiyati(
    ToursModel tur,
  ) {
    if (tur.otelSecenekleri == null || tur.otelSecenekleri!.isEmpty) {
      return "Yok";
    }
    final fiyat = tur.otelSecenekleri![0]['odaFiyatlari']?['Ikili'];
    return "${fiyat ?? 'Yok'} ${currencySymbols[tur.currency] ?? tur.currency}";
  }

  Widget getTravelIcon(String travelType) {
    switch (travelType) {
      case "Otobüs":
        return const Icon(FontAwesomeIcons.bus, color: Colors.white, size: 30);
      case "Uçak":
        return const Icon(FontAwesomeIcons.planeDeparture, color: Colors.white, size: 30);
      case "Tren":
        return const Icon(FontAwesomeIcons.trainTram, color: Colors.white, size: 33);
      case "Gemi":
        return const Icon(Icons.directions_boat_filled, color: Colors.white, size: 35);

      default:
        return Container();
    }
  }
}
