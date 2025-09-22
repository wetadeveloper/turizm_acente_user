import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamet/Tours/View/anasayfa_tur_page.dart';
import 'package:selamet/Tours/widgets/custom_button.dart';

class AnasayfaButonlari extends StatelessWidget {
  const AnasayfaButonlari({super.key});

  // Text sabitleri
  static const String hacUmreTitle = 'Hac & Umre Turları';
  static const String hacUmreServiceTitle = 'hac_umre_turlari';
  static const String hacUmreAdServiceName = 'HacUmreTurlariReklamlari';

  static const String anadoluTitle = 'Anadolu Turları';
  static const String anadoluServiceTitle = 'anadolu_turlari';
  static const String anadoluAdServiceName = 'AnadoluTurlariReklamlari';

  static const String karadenizTitle = 'Karadeniz Turları';
  static const String karadenizServiceTitle = 'karadeniz_turlari';
  static const String karadenizAdServiceName = 'KaradenizTurlariReklamlari';

  static const String denizTatiliTitle = 'Deniz Tatilleri';
  static const String denizTatiliServiceTitle = 'deniz_tatilleri';

  static const String gastronomiTitle = 'Gastronomi Turları';
  static const String gastronomiServiceTitle = 'gastronomi_turlari';
  static const String gastronomiAdServiceName = 'GastronomiTurlariReklamlari';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnasayafaTurPage(
                                serviceTitle: hacUmreServiceTitle,
                                title: hacUmreTitle,
                                adServiceName: hacUmreAdServiceName,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.deepPurple, Colors.red.shade800],
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.kaaba,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 15),
                              Text(
                                hacUmreTitle,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomButton(
                  title: 'Anadolu',
                  subTitle: 'Turları',
                  icon: FontAwesomeIcons.archway,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnasayafaTurPage(
                          serviceTitle: anadoluServiceTitle,
                          title: anadoluTitle,
                          adServiceName: anadoluAdServiceName,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10.0),
                CustomButton(
                  title: 'Karadeniz',
                  subTitle: 'Turları',
                  icon: FontAwesomeIcons.mountainSun,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnasayafaTurPage(
                          serviceTitle: karadenizServiceTitle,
                          title: karadenizTitle,
                          adServiceName: karadenizAdServiceName,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                CustomButton(
                  title: 'Deniz',
                  subTitle: 'Tatilleri',
                  icon: FontAwesomeIcons.umbrellaBeach,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnasayafaTurPage(
                          serviceTitle: denizTatiliServiceTitle,
                          title: denizTatiliTitle,
                          adServiceName: '',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10.0),
                CustomButton(
                  title: 'Gastronomi',
                  subTitle: 'Turları',
                  icon: FontAwesomeIcons.utensils,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnasayafaTurPage(
                          serviceTitle: gastronomiServiceTitle,
                          title: gastronomiTitle,
                          adServiceName: gastronomiAdServiceName,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
