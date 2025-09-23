import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selamet/Feature/Campaings/model/campaign.dart';

class CampaingsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Campaign>> fetchCampaigns() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore.collection('TumKampanyalar').get();

    return querySnapshot.docs.map((doc) => Campaign.fromFirestore(doc)).toList();
  }
}
