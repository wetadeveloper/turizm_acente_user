import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TourismTileWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productHost;
  final String productDate;
  final String acentaAdi;
  final String turSehri;
  final String currency;

  const TourismTileWidget({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productHost,
    required this.productDate,
    required this.acentaAdi,
    required this.turSehri,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> currencySymbols = {
      "Dolar": "\$",
      "Türk Lirası": "₺",
      "Euro": "€",
    };
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 0,
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: Text(
                        productName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text(
                        turSehri,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kişi başı',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$productPrice ${currencySymbols[currency] ?? currency}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              ListTile(
                isThreeLine: false,
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffeaeaea),
                  radius: 26,
                  child: Icon(
                    FontAwesomeIcons.calendar,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                title: Text(
                  "Tarih",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  productDate,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
