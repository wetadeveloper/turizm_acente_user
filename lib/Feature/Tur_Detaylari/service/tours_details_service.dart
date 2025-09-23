import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selamet/Feature/Tours/model/tours_model.dart';

class ToursDetailsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Tours>> fetchTours() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore.collection('hac_umre_turlari').get();

    return querySnapshot.docs.map((doc) => Tours.fromFirestore(doc)).toList();
  }
}
