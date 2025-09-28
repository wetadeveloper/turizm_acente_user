import 'package:cloud_firestore/cloud_firestore.dart';

//Resimler içinde bir şey ayarlıcaz
class ToursModel {
  final String turID;
  final String turAdi;
  final String acenteAdi;
  final String turSuresi;
  final String yolculukTuru;
  final String turunGidecegiSehir;
  final String? turunKalktigiSehir;
  final List<String> turDetaylari;
  final List<String> fiyataDahilHizmetler;
  final List<Map<String, dynamic>>? otelSecenekleri;
  final int kapasite;
  final bool turOnayi;
  final bool turYayinda;
  final DateTime date;
  final String? currency;

  ToursModel({
    required this.turID,
    required this.turAdi,
    required this.acenteAdi,
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
    required this.currency,
  });

  factory ToursModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return ToursModel(
      turID: doc.id,
      turAdi: data['tur_adi'] ?? '',
      acenteAdi: data['acente_adi'] ?? '',
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
      currency: data['currency'] ?? 'Dolar',
    );
  }

  factory ToursModel.fromMap(Map<String, dynamic> data, {String? id}) {
    return ToursModel(
      turID: id ?? data['turID'] ?? '',
      turAdi: data['tur_adi'] ?? '',
      acenteAdi: data['acenta_adi'] ?? '',
      date: (data['tarih'] as Timestamp?)?.toDate() ?? DateTime.now(),
      turSuresi: data['tur_suresi'] ?? '',
      yolculukTuru: data['yolculuk_turu'] ?? '',
      turunGidecegiSehir: data['turungidecegiSehir'] ?? '',
      turunKalktigiSehir: data['turunkalkacagiSehir'] ?? '',
      otelSecenekleri: data['otelSecenekleri'] != null
          ? List<Map<String, dynamic>>.from(
              (data['otelSecenekleri'] as List).map((otel) => Map<String, dynamic>.from(otel)),
            )
          : null,
      kapasite: data['kapasite'] ?? 0,
      turOnayi: data['tur_onayi'] ?? false,
      turYayinda: data['tur_yayinda'] ?? false,
      turDetaylari: List<String>.from(data['turDetaylari'] ?? []),
      fiyataDahilHizmetler: List<String>.from(data['fiyataDahilHizmetler'] ?? []),
      currency: data['currency'] ?? 'Dolar',
    );
  }
}
