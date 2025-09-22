import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selamet/Tours/model/tours_model.dart';

class ToursService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Tours>> fetchTours(String serviceTitle) async {
    final querySnapshot = await _firestore.collection(serviceTitle).get();
    return querySnapshot.docs.map((doc) {
      return Tours.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>);
    }).toList();
  }
}
