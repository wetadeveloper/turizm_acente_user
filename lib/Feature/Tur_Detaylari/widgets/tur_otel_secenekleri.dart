import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TurDetaylariOtelSecenekleriWidget extends StatelessWidget {
  final List<Map<String, dynamic>> otelSecenekleri;

  const TurDetaylariOtelSecenekleriWidget({super.key, required this.otelSecenekleri});

  @override
  Widget build(BuildContext context) {
    if (otelSecenekleri.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 1.5, indent: 20, endIndent: 20),
        const SizedBox(height: 5),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 550,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: otelSecenekleri.length,
                        itemBuilder: (context, index) {
                          final otel = otelSecenekleri[index];
                          final List imageUrls =
                              otel['otelImageUrls'] is List ? otel['otelImageUrls'] : [otel['otelImageUrls']];
                          final double yildiz = double.tryParse(otel['otelYildiz'].toString()) ?? 0;
                          final fiyatlar = otel['odaFiyatlari'] is Map<String, dynamic>
                              ? Map<String, dynamic>.from(otel['odaFiyatlari'])
                              : null;

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (imageUrls.isNotEmpty)
                                    imageUrls.length == 1
                                        ? Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.network(
                                                imageUrls[0],
                                                height: 120,
                                                width: 180,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, __, ___) => const Icon(Icons.image),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 120,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: imageUrls.length,
                                              itemBuilder: (context, imgIndex) {
                                                return Container(
                                                  margin: const EdgeInsets.only(right: 10),
                                                  width: 150,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.network(
                                                      imageUrls[imgIndex],
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (_, __, ___) => const Icon(Icons.image),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                  const SizedBox(height: 10),
                                  RatingBarIndicator(
                                    rating: yildiz,
                                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    direction: Axis.horizontal,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(otel['otelAdi'] ?? '',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text("Bölge: ${otel['otelAdres'] ?? ''}"),
                                  const SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("2 Kişilik Oda: ${fiyatlar?['Ikili']} \$"),
                                      Text("3 Kişilik Oda: ${fiyatlar?['Uclu']} \$"),
                                      Text("4 Kişilik Oda: ${fiyatlar?['Dortlu']} \$"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
            child: const Text("Otel Seçeneklerini Gör"),
          ),
        ),
      ],
    );
  }
}
