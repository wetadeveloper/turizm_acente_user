import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:selamet/Feature/Tours/View/card_widget.dart';
import 'package:selamet/Feature/Tours/model/tours_model.dart';
import 'package:selamet/Feature/Tur_Detaylari/bloc/tours_details_bloc.dart';
import 'package:selamet/Feature/Tur_Detaylari/bloc/tours_details_event.dart';
import 'package:selamet/Feature/Tur_Detaylari/service/tur_detay_repository.dart';
import 'package:selamet/Feature/Tur_Detaylari/view/tur_detay_sayfasi.dart';

class TurlarAnasayfaWidget extends StatelessWidget {
  const TurlarAnasayfaWidget({
    super.key,
    required this.isTurVisible,
    required this.context,
    required this.data,
  });

  final bool isTurVisible;
  final BuildContext context;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final String turAdi = data['tur_adi'] ?? '';
    final String acentaAdi = data['acenta_adi'] ?? '';
    final Timestamp? tarih = data['tarih'];
    final String yolculukTuru = data['yolculuk_turu'] ?? '';
    final int kapasite = data['kapasite'] ?? 0;
    final bool turYayinda = data['tur_yayinda'] ?? false;
    final bool turOnayi = data['tur_onayi'] ?? false;

    // Null kontrolü
    if (tarih == null) return Container();

    DateTime dateTime = tarih.toDate();
    final DateFormat formatter = DateFormat('dd/MM');
    final String formattedDate = formatter.format(dateTime);
    DateTime currentDate = DateTime.now();

    if (dateTime.isBefore(currentDate) || !turYayinda || !turOnayi) {
      return Container(); // turu gösterme
    }

    // ToursModel'e dönüştür → CardWidget içinde kullanılacak
    final turModel = ToursModel.fromMap(data);

    return Visibility(
      visible: isTurVisible && kapasite > 0,
      child: InkWell(
        onTap: () {
          final String? turID = data['turID'] ?? data['tur_id'];

          if (kapasite > 0 && turID != null) {
            final repository = TurDetayRepository();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => TurDetayBloc(repository)
                    ..add(LoadTurDetay(
                      turData: data,
                      turID: turID,
                    )),
                  child: TurDetaySayfasi(turData: data),
                ),
              ),
            );
          } else {
            if (kDebugMode) {
              print("Tur dolu veya eksik veri");
            }

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Tur Dolu veya Veri Hatalı'),
                content: const Text('Maalesef, bu tur dolu ya da bazı veriler eksik.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Tamam'),
                  ),
                ],
              ),
            );
          }
        },
        child: AnasayfaTurlarCardWidget(
          yolculukTuru: yolculukTuru,
          context: context,
          turAdi: turAdi,
          acentaAdi: acentaAdi,
          formattedDate: formattedDate,
          kapasite: kapasite,
          data: data,
          turModel: turModel,
        ),
      ),
    );
  }
}
