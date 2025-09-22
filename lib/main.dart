import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:selamet/Campaings/bloc/campaign_bloc.dart';
import 'package:selamet/Campaings/bloc/campaign_event.dart';
import 'package:selamet/Tours/service/tours_service.dart';
import 'package:selamet/Tours/bloc/tours_bloc.dart';
import 'package:selamet/Tur_Detaylari/bloc/tours_details_bloc.dart';
import 'package:selamet/Tur_Detaylari/service/tur_detay_repository.dart';
import 'package:selamet/core/theme/light_theme_data.dart';
import 'package:selamet/Campaings/service/campaigns_service.dart';
import 'package:selamet/HomePage/bottomnavbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('tr_TR', null);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CampaignBloc(firestoreService: CampaingsService())..add(FetchCampaigns()),
        ),
        BlocProvider(
          create: (_) => ToursBloc(firestoreService: ToursService()),
        ),
        BlocProvider(
          create: (context) => TurDetayBloc(
            TurDetayRepository(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().lightThemeData,
      home: const BottomNavBar(),
    );
  }
}
