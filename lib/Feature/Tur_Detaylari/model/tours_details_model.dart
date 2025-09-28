import 'package:cloud_firestore/cloud_firestore.dart';

class TurDetayModel {
  final String turID;
  final String turAdi;
  final String acentaAdi;
  final String turSehri;
  final DateTime tarih;
  final List<String> turDetaylari;
  final List<String> fiyataDahilHizmetler;
  final List<String> imageUrls;
  final int kapasite;
  final String yolculukTuru;
  final String turSuresi;
  final String havaYolu;
  final String currency;

  // Otel seçenekleri
  final List<Map<String, dynamic>> otelSecenekleri;

  TurDetayModel({
    required this.turID,
    required this.turAdi,
    required this.acentaAdi,
    required this.turSehri,
    required this.tarih,
    required this.turDetaylari,
    required this.fiyataDahilHizmetler,
    required this.imageUrls,
    required this.kapasite,
    required this.yolculukTuru,
    required this.turSuresi,
    required this.havaYolu,
    required this.otelSecenekleri,
    required this.currency,
  });

  factory TurDetayModel.fromMap(Map<String, dynamic> map) {
    return TurDetayModel(
      turID: map['turID'] ?? '',
      turAdi: map['tur_adi'] ?? '',
      acentaAdi: map['acenta_adi'] ?? '',
      currency: map['currency'] ?? 'Dolar',
      turSehri: map['turungidecegiSehir'] ?? '',
      tarih: (map['tarih'] as Timestamp?)?.toDate() ?? DateTime.now(),
      turDetaylari: List<String>.from(map['turDetaylari'] ?? []),
      fiyataDahilHizmetler: List<String>.from(map['fiyataDahilHizmetler'] ?? []),
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      kapasite: (map['kapasite'] as num?)?.toInt() ?? 0,
      yolculukTuru: map['yolculuk_turu'] ?? '',
      turSuresi: map['tur_suresi'] ?? '',
      havaYolu: map['hava_yolu'] ?? '',
      otelSecenekleri: List<Map<String, dynamic>>.from(
          (map['otelSecenekleri'] ?? []).map((otel) => Map<String, dynamic>.from(otel))),
    );
  }

  get odaFiyatlari => null;

  TurDetayModel copyWith({
    String? turID,
    String? turAdi,
    String? acentaAdi,
    Map<String, int>? odaFiyatlari,
    String? turSehri,
    DateTime? tarih,
    List<String>? turDetaylari,
    List<String>? fiyataDahilHizmetler,
    List<String>? imageUrls,
    int? kapasite,
    String? yolculukTuru,
    String? turSuresi,
    String? havaYolu,
    String? currency,
    List<Map<String, dynamic>>? otelSecenekleri,
  }) {
    return TurDetayModel(
      turID: turID ?? this.turID,
      turAdi: turAdi ?? this.turAdi,
      acentaAdi: acentaAdi ?? this.acentaAdi,
      turSehri: turSehri ?? this.turSehri,
      tarih: tarih ?? this.tarih,
      turDetaylari: turDetaylari ?? this.turDetaylari,
      fiyataDahilHizmetler: fiyataDahilHizmetler ?? this.fiyataDahilHizmetler,
      imageUrls: imageUrls ?? this.imageUrls,
      kapasite: kapasite ?? this.kapasite,
      yolculukTuru: yolculukTuru ?? this.yolculukTuru,
      turSuresi: turSuresi ?? this.turSuresi,
      havaYolu: havaYolu ?? this.havaYolu,
      otelSecenekleri: otelSecenekleri ?? this.otelSecenekleri,
      currency: currency ?? this.currency,
    );
  }
}
