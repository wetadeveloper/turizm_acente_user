import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String _tumReklamlarCollection = "TumReklamlar";
String _reklamDurumu = "reklamDurumu";
String _reklaminGecerliOlduguTarih = "reklaminGecerliOlduguTarih";
String _gorselUrl = "gorselURL";
String _subCollection = "rek";

class ReklamService {
  final String turAdi;
  final List<String> adUrls;

  ReklamService({required this.turAdi, required this.adUrls});

  Future<void> loadAds() async {
    try {
      QuerySnapshot adSnapshot = await FirebaseFirestore.instance
          .collection(_tumReklamlarCollection)
          .doc(turAdi)
          .collection(_subCollection)
          .where(_reklamDurumu, isEqualTo: true)
          .where(_reklaminGecerliOlduguTarih, isGreaterThanOrEqualTo: Timestamp.now())
          .get();

      for (var doc in adSnapshot.docs) {
        String adUrl = doc[_gorselUrl];
        adUrls.add(adUrl);
      }
    } catch (e) {
      // Hata durumunda burada hatayı ele alabilirsiniz.
      debugPrint('Reklam yükleme hatası: $e');
    }
  }
}
