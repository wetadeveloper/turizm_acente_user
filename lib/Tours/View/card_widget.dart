import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnasayfaTurlarCardWidget extends StatelessWidget {
  const AnasayfaTurlarCardWidget({
    super.key,
    required this.yolculukTuru,
    required this.context,
    required this.turAdi,
    required this.acentaAdi,
    required this.formattedDate,
    required this.kapasite,
    required this.fiyat,
    required Map<String, dynamic> data,
  });

  final String yolculukTuru;
  final BuildContext context;
  final String turAdi;
  final String acentaAdi;
  final String formattedDate;
  final int kapasite;
  final int fiyat;

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

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF006688),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getTravelIcon(yolculukTuru),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 0,
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    child: Text(
                      turAdi,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  acentaAdi,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Kişi Başı Fiyatı",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Tarih: ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade100,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  kapasite <= 20 ? 'Son $kapasite kişi' : '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$fiyat TL',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
