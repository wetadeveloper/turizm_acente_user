import 'package:flutter/material.dart';

class AnasayfaFilterWidget extends StatelessWidget {
  final TextEditingController minFiyatController;
  final TextEditingController maxFiyatController;
  final String selectedCity;
  final ValueChanged<String?> onCityChanged;
  final VoidCallback onFilterPressed;

  const AnasayfaFilterWidget({
    super.key,
    required this.minFiyatController,
    required this.maxFiyatController,
    required this.selectedCity,
    required this.onCityChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Fiyata Göre Filtrele'),
                  content: Column(
                    children: [
                      const Text('En düşük fiyat'),
                      TextFormField(
                        controller: minFiyatController,
                        keyboardType: TextInputType.number,
                      ),
                      const Text('En yüksek fiyat'),
                      TextFormField(
                        controller: maxFiyatController,
                        keyboardType: TextInputType.number,
                      ),
                      const Text('Şehir'),
                      DropdownButton<String>(
                        value: selectedCity,
                        onChanged: onCityChanged,
                        items: const [
                          DropdownMenuItem(
                            value: '', // Tüm şehirler için boş değer
                            child: Text('Tüm Şehirler'),
                          ),
                          DropdownMenuItem(
                            value: 'İstanbul',
                            child: Text('İstanbul'),
                          ),
                          DropdownMenuItem(
                            value: 'Ankara',
                            child: Text('Ankara'),
                          ),
                          DropdownMenuItem(
                            value: 'Konya',
                            child: Text('Konya'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: onFilterPressed,
                      child: const Text('Tamam'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.filter_list),
            label: const Text('Filtrele'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Tarihe göre sıralama işlevselliği buraya eklenebilir, gerektiğinde
            },
            icon: const Icon(Icons.date_range),
            label: const Text('Tarihe Göre Sırala'),
          ),
        ],
      ),
    );
  }
}
