import 'package:cloud_firestore/cloud_firestore.dart';

//Resimler içinde bir şey ayarlıcaz
class Tours {
  final String turID;
  final String turAdi;
  final String acenteAdi;
  final String acenteID;
  final String turSuresi;
  final String yolculukTuru;
  final String turunGidecegiSehir;
  final String turunKalktigiSehir;
  final List<String> turDetaylari;
  final List<String> fiyataDahilHizmetler;
  final List<Map<String, dynamic>>? otelSecenekleri;
  final int kapasite;
  final bool turOnayi;
  final bool turYayinda;
  final DateTime date;

  Tours({
    required this.turID,
    required this.turAdi,
    required this.acenteAdi,
    required this.acenteID,
    required this.date,
    required this.turSuresi,
    required this.yolculukTuru,
    required this.turunGidecegiSehir,
    required this.turunKalktigiSehir,
    required this.otelSecenekleri,
    required this.kapasite,
    required this.turOnayi,
    required this.turYayinda,
    required this.turDetaylari,
    required this.fiyataDahilHizmetler,
  });

  factory Tours.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Tours(
      turID: doc.id,
      turAdi: data['tur_adi'] ?? '',
      acenteAdi: data['acente_adi'] ?? '',
      acenteID: data['acente_id'] ?? '',
      date: data['tarih'].toDate() ?? DateTime.now(),
      turSuresi: data['tur_suresi'] ?? '',
      yolculukTuru: data['yolculuk_turu'] ?? '',
      turunGidecegiSehir: data['turungidecegiSehir'] ?? '',
      turunKalktigiSehir: data['turunkalkacagiSehir'] ?? '',
      otelSecenekleri: List<Map<String, dynamic>>.from(
          (data['otelSecenekleri'] ?? []).map((otel) => Map<String, dynamic>.from(otel))),
      kapasite: data['kapasite'] ?? 0,
      turOnayi: data['tur_onayi'] ?? false,
      turYayinda: data['tur_yayinda'] ?? false,
      turDetaylari: List<String>.from(data['turDetaylari'] ?? []),
      fiyataDahilHizmetler: List<String>.from(data['fiyataDahilHizmetler'] ?? []),
    );
  }
}
