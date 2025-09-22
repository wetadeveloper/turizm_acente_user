import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selamet/Tours/View/turlar_anasayfa_widget.dart';

// ignore: must_be_immutable
class TurlarStreamBuilder extends StatelessWidget {
  final Stream<QuerySnapshot> stream;
  final List<QueryDocumentSnapshot> filteredDocs;
  final bool noToursAvailable;
  final bool sortByDate;
  final double maxFiyat;
  final double minFiyat;
  final String selectedCity;
  final bool isTurVisible;
  bool allToursExpired;

  TurlarStreamBuilder({
    super.key,
    required this.stream,
    required this.filteredDocs,
    required this.noToursAvailable,
    required this.sortByDate,
    required this.maxFiyat,
    required this.minFiyat,
    required this.selectedCity,
    required this.isTurVisible,
    required this.allToursExpired,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Bir hata oluştu: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        List<QueryDocumentSnapshot> filteredDocs = snapshot.data!.docs;

        if (selectedCity.isNotEmpty) {
          filteredDocs = filteredDocs.where((doc) => doc['turungidecegiSehir'] == selectedCity).toList();
        }

        if (sortByDate) {
          filteredDocs.sort((a, b) => a['tarih'].compareTo(b['tarih']));
        }

        final List<Widget> turWidgets = filteredDocs.map((DocumentSnapshot document) {
          final Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

          return TurlarAnasayfaWidget(isTurVisible: isTurVisible, context: context, data: data);
        }).toList();
        allToursExpired = turWidgets.every((widget) => widget is Container);

        if (turWidgets.isEmpty && noToursAvailable) {
          return Container();
        }

        return Column(
          children: turWidgets,
        );
      },
    );
  }
}
