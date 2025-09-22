import 'package:flutter/material.dart';
import 'package:selamet/Tur_Detaylari/model/tours_details_model.dart';

class TurDetaylariBottomMenu extends StatelessWidget {
  final TurDetayModel turDetayModel;

  const TurDetaylariBottomMenu({super.key, required this.turDetayModel});

  Widget getTravelIcon(String travelType) {
    switch (travelType) {
      case "Otobüs":
        return const Icon(Icons.directions_bus_sharp, size: 35);
      case "Uçak":
        return const Icon(Icons.airplanemode_active, size: 35);
      case "Tren":
        return const Icon(Icons.train, size: 35);
      case "Gemi":
        return const Icon(Icons.directions_boat_filled, size: 35);
      default:
        return const Icon(Icons.help_outline, size: 35);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Tur Süresi
          Column(
            children: <Widget>[
              const Icon(Icons.timelapse, size: 35),
              const SizedBox(height: 15),
              const Text("Tur Süresi", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(turDetayModel.turSuresi, style: const TextStyle(fontSize: 14, color: Color(0xFFa9a9a9))),
            ],
          ),
          // Yolculuk Türü
          Column(
            children: <Widget>[
              getTravelIcon(turDetayModel.yolculukTuru),
              const SizedBox(height: 15),
              const Text("Yolculuk Türü", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(turDetayModel.yolculukTuru, style: const TextStyle(fontSize: 14, color: Color(0xFFa9a9a9))),
            ],
          ),
          // Havayolu Bilgisi (sadece Uçak için)
          if (turDetayModel.yolculukTuru == "Uçak" && turDetayModel.havaYolu.isNotEmpty)
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(child: Text("Havayolu Bilgisi")),
                    content: Text("Uçuş Havayolu: ${turDetayModel.havaYolu}"),
                    actions: [
                      TextButton(
                        child: const Text("Kapat"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                );
              },
              child: const Column(
                children: [
                  Icon(Icons.flight_takeoff, size: 35),
                  SizedBox(height: 15),
                  Text("Havayolu", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text("Tıklayın", style: TextStyle(fontSize: 14, color: Color(0xFFa9a9a9))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
