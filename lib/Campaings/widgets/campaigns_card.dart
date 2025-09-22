import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selamet/Campaings/model/campaign.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({super.key, required this.campaign});
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(campaign.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFfd3f40),
                      )),
            ),
            const SizedBox(height: 20),
            Text(campaign.description,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text('Başlangıç Tarihi: ${dateFormat.format(campaign.startDate)}',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('Bitiş Tarihi: ${dateFormat.format(campaign.endDate)}',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text(
              campaign.isActive ? 'Aktif' : 'Pasif',
              style: TextStyle(
                color: campaign.isActive ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
