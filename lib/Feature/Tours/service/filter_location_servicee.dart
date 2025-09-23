/*import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<void> getLocation() async {
    bool serviceEnabled;
   // LocationPermission permission;

    // Servislerin etkin olup olmadığını kontrol edin
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Servisler etkin değilse, kullanıcıyı konum servislerini etkinleştirmeye yönlendirin
      return;
    }

    // Konum izinlerini kontrol edin
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Konum izni reddedildiyse, izin isteyin
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Kullanıcı konum iznini reddetti, hata mesajını gösterin veya uygun bir işlem yapın
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Kullanıcı, konum iznini kalıcı olarak reddetti, hata mesajını gösterin veya uygun bir işlem yapın
      return;
    }
  }
}
*/