import 'package:flutter/material.dart';

class ReklamModel extends StatelessWidget {
  const ReklamModel({
    super.key,
    required List<String> adUrls,
    required PageController pageController,
  })  : _adUrls = adUrls,
        _pageController = pageController;

  final List<String> _adUrls;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 200,
        child: _adUrls.isEmpty
            ? const CircularProgressIndicator() // Veri yüklenene kadar bekleyin
            : PageView.builder(
                controller: _pageController,
                itemCount: _adUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Reklama tıklandığında yapılacak işlem
                      // launch(_adUrls[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(_adUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
