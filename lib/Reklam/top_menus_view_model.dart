import 'package:flutter/material.dart';
import 'package:selamet/Reklam/View/reklam_view.dart';
import 'package:selamet/Reklam/service/reklam_service.dart';
import 'package:selamet/Reklam/viewModel/timer.dart';

class TopMenus extends StatefulWidget {
  final String serviceName;
  const TopMenus({super.key, required this.serviceName});

  @override
  TopMenusState createState() => TopMenusState();
}

class TopMenusState extends State<TopMenus> {
  String turAdi = '';
  PageController _pageController = PageController();
  final List<String> _adUrls = []; // Tüm reklam URL'lerini saklamak için bir liste
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    turAdi = widget.serviceName;
    _pageController = PageController(); // PageController'ı burada başlatın ve ekleyin
    _loadAds(); // Reklamları yükle
    AdTimer(adUrls: _adUrls, pageController: _pageController).startTimer();
  }

  @override
  void dispose() {
    AdTimer(adUrls: _adUrls, pageController: _pageController).stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _loadAds() async {
    await ReklamService(turAdi: turAdi, adUrls: _adUrls).loadAds();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Reklamlar yüklenene kadar dönme animasyonu göster
      return const CircularProgressIndicator();
    } else {
      // Reklamlar yüklendiyse ReklamModel widget'ini döndür
      return ReklamModel(adUrls: _adUrls, pageController: _pageController);
    }
  }
}
