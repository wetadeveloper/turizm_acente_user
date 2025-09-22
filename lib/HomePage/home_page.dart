import 'package:flutter/material.dart';
import 'package:selamet/Reklam/viewModel/top_reklam_menus.dart';
import 'package:selamet/Tours/widgets/anasayfa.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    const String selectedTour = 'AnasayfaReklamlari';

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selamet Turizm'),
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TopMenus(
                serviceName: selectedTour,
              ),
              AnasayfaButonlari(),
            ],
          ),
        ),
      ),
    );
  }
}
