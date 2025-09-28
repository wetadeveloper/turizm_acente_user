import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:selamet/Feature/Tur_Detaylari/bloc/tours_details_bloc.dart';
import 'package:selamet/Feature/Tur_Detaylari/bloc/tours_details_state.dart';
import 'package:selamet/Feature/Tur_Detaylari/model/tours_details_model.dart';
import 'package:selamet/Feature/Tur_Detaylari/widgets/tur_detaylari_bilgi_al.dart';
import 'package:selamet/Feature/Tur_Detaylari/widgets/tur_detaylari_carousel.dart';
import 'package:selamet/Feature/Tur_Detaylari/widgets/tur_detaylari_bottommenu.dart';
import 'package:selamet/Feature/Tur_Detaylari/widgets/tur_detaylari_yazi_duzenleri.dart';
import 'package:selamet/Feature/Tur_Detaylari/widgets/tur_otel_secenekleri.dart';

class TurDetaySayfasi extends StatelessWidget {
  final Map<String, dynamic> turData;

  const TurDetaySayfasi({super.key, required this.turData});

  @override
  Widget build(BuildContext context) {
    return _TurDetayView(turData);
  }
}

class _TurDetayView extends StatelessWidget {
  final Map<String, dynamic> turData;
  const _TurDetayView(this.turData);

  @override
  Widget build(BuildContext context) {
    final model = TurDetayModel.fromMap(turData);
    List<String> imageUrlsFromModel = [];
    imageUrlsFromModel = model.imageUrls;
    return BlocBuilder<TurDetayBloc, TurDetayState>(
      builder: (context, state) {
        if (state is TurDetayLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state is TurDetayError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        if (state is TurDetayLoaded) {
          final tur = state.tur;

          String formattedDate;
          try {
            formattedDate = DateFormat('dd MMMM y', 'tr_TR').format(tur.tarih);
          } catch (e) {
            formattedDate = DateFormat('dd MMMM y').format(tur.tarih); // Varsayılan locale fallback
          }

          String? fiyatText;
          final List<dynamic>? otelSecenekleri = turData['otelSecenekleri'];

          if (otelSecenekleri != null && otelSecenekleri.isNotEmpty) {
            final Map<String, dynamic> ilkOtel = Map<String, dynamic>.from(otelSecenekleri[0]);
            final Map<String, dynamic> odaFiyatlari = Map<String, dynamic>.from(ilkOtel['odaFiyatlari'] ?? {});
            fiyatText = "4'lü Oda: ${odaFiyatlari['Dortlu'] ?? 0}";
          }

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(tur.turAdi, style: Theme.of(context).textTheme.titleLarge),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TurDetaylariCarouselSliderWidget(
                      imageUrlsFromModel: imageUrlsFromModel,
                      turID: tur.turID,
                    ),
                    const SizedBox(height: 10),
                    TourismTileWidget(
                      productName: tur.turAdi,
                      productPrice: fiyatText ?? 'Fiyat Bilgisi Yok',
                      productHost: tur.acentaAdi,
                      productDate: formattedDate,
                      acentaAdi: tur.acentaAdi,
                      turSehri: tur.turSehri,
                      currency: tur.currency,
                    ),
                    TurDetaylariOtelSecenekleriWidget(
                      otelSecenekleri: tur.otelSecenekleri,
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 1.5, indent: 20, endIndent: 20),
                    const SizedBox(height: 5),
                    const TabBar(
                      labelColor: Color(0xFFfd3f40),
                      indicatorColor: Color(0xFFfd3f40),
                      tabs: [
                        Tab(text: 'Tur Programı'),
                        Tab(text: 'Fiyata Dahil Hizmetler'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: TabBarView(
                        children: [
                          _buildList(tur.turDetaylari, context),
                          _buildList(tur.fiyataDahilHizmetler, context),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TurDetaylariBottomMenu(
                      turDetayModel: model,
                    ),
                    const SizedBox(height: 110),
                  ],
                ),
              ),
              floatingActionButton: BilgiAlButton(context: context),
            ),
          );
        }

        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildList(List<String> items, BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Center(
        child: Text(
          items[index],
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
