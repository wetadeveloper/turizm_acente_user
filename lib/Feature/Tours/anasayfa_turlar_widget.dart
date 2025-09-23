import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selamet/Feature/Tours/service/tour_filter_service.dart';
import 'package:selamet/Feature/Tours/View/filter_widget.dart';

class AnasayfaTurlarWidget extends StatefulWidget {
  const AnasayfaTurlarWidget({
    super.key,
    required this.serviceTitle,
  });
  final String serviceTitle;

  @override
  State<AnasayfaTurlarWidget> createState() => _AnasayfaTurlarWidgetState();
}

class _AnasayfaTurlarWidgetState extends State<AnasayfaTurlarWidget> {
  bool isTurVisible = true;
  Timer? visibilityTimer;
  List<QueryDocumentSnapshot> filteredDocs = [];

  double maxFiyat = 100000.0;
  double minFiyat = 0.0;
  bool sortByDate = false;
  String selectedCity = '';
  bool allToursExpired = true;

  TextEditingController minFiyatController = TextEditingController();
  TextEditingController maxFiyatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startVisibilityTimer();
    if (maxFiyat == double.infinity) {
      maxFiyat = 10000.0;
    }
    minFiyatController.text = minFiyat.toString();
    maxFiyatController.text = maxFiyat.toString();
  }

  @override
  void dispose() {
    visibilityTimer?.cancel();
    minFiyatController.dispose();
    maxFiyatController.dispose();
    super.dispose();
  }

  void startVisibilityTimer() {
    visibilityTimer = Timer(const Duration(minutes: 1), () {
      setState(() {
        isTurVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final turlarRef = FirebaseFirestore.instance.collection(widget.serviceTitle);
    final bool noToursAvailable = filteredDocs.isEmpty;

    return Column(
      children: [
        AnasayfaFilterWidget(
          minFiyatController: minFiyatController,
          maxFiyatController: maxFiyatController,
          selectedCity: selectedCity,
          onCityChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedCity = newValue;
              });
            }
          },
          onFilterPressed: () {
            setState(() {
              sortByDate = !sortByDate;
            });
          },
        ),
        TurlarStreamBuilder(
          stream: turlarRef.snapshots(),
          filteredDocs: filteredDocs,
          noToursAvailable: noToursAvailable,
          sortByDate: sortByDate,
          maxFiyat: maxFiyat,
          minFiyat: minFiyat,
          selectedCity: selectedCity,
          isTurVisible: isTurVisible,
          allToursExpired: allToursExpired,
        )
      ],
    );
  }
}
