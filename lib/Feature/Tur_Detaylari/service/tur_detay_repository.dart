import 'package:firebase_storage/firebase_storage.dart';

class TurDetayRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> getTurImages(String turID) async {
    try {
      final imagesRef = _storage.ref('users/turFotograflari/$turID/fotograflar');
      final result = await imagesRef.listAll();
      return await Future.wait(result.items.map((ref) => ref.getDownloadURL()));
    } catch (e) {
      return [];
    }
  }
}
