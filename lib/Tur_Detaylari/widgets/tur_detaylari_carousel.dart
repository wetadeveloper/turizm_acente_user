import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TurDetaylariCarouselSliderWidget extends StatelessWidget {
  final List<String> imageUrlsFromModel;
  final String turID;

  const TurDetaylariCarouselSliderWidget({
    super.key,
    required this.imageUrlsFromModel,
    required this.turID,
  });

  Future<List<String>> _getImageUrls() async {
    if (imageUrlsFromModel.isNotEmpty) {
      return imageUrlsFromModel;
    }

    try {
      if (kDebugMode) {
        print('Firestore boş, Firebase Storage\'dan resimler alınıyor...');
      }
      final storageRef = FirebaseStorage.instance.ref('turFotograflari/$turID/fotograflar');
      final result = await storageRef.listAll();
      final urls = await Future.wait(result.items.map((ref) => ref.getDownloadURL()));
      if (kDebugMode) {
        print('Firebase Storage\'dan indirilen imageUrls: $urls');
      }
      return urls;
    } catch (e) {
      if (kDebugMode) {
        print('Firebase Storage hata: $e');
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _getImageUrls(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(
              child: Image.asset(
                'assets/images/no_image.png', // Varsa varsayılan görsel
                fit: BoxFit.cover,
              ),
            ),
          );
        }

        final imageUrls = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
          ),
          items: imageUrls.map((url) => _buildImage(context, url)).toList(),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context, String url) {
    final bool isUrlValid = url.isNotEmpty && Uri.tryParse(url)?.hasAbsolutePath == true;

    return GestureDetector(
      onTap: isUrlValid ? () => _showFullScreenImage(context, url) : null, // boş url'de büyütme yok
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) => Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: const Icon(Icons.image),
        ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierDismissible: false, // sadece X ile kapanır
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.of(context).pop(); // dialog kapatılır

                  // ❗Yönlendirme yapılacaksa buradan ekle:
                  // Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
