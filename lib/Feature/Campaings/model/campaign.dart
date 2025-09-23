import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;

  Campaign({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory Campaign.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!;
    return Campaign(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      isActive: data['isActive'] ?? false,
    );
  }
}
