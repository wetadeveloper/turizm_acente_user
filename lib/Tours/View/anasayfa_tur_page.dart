import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selamet/Reklam/viewModel/top_reklam_menus.dart';
import 'package:selamet/Tours/anasayfa_turlar_widget.dart';
import 'package:selamet/Tours/bloc/tours_bloc.dart';
import 'package:selamet/Tours/bloc/tours_event.dart';
import 'package:selamet/Tours/bloc/tours_state.dart';

class AnasayafaTurPage extends StatefulWidget {
  final String serviceTitle, title, adServiceName;

  const AnasayafaTurPage({super.key, required this.serviceTitle, required this.title, required this.adServiceName});

  @override
  State<AnasayafaTurPage> createState() => _AnasayafaTurPageState();
}

class _AnasayafaTurPageState extends State<AnasayafaTurPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ToursBloc>().add(FetchTours(widget.serviceTitle));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<ToursBloc, ToursState>(
        builder: (context, state) {
          if (state is ToursLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ToursLoaded) {
            return ListView(
              children: [
                TopMenus(serviceName: widget.adServiceName),
                const SizedBox(height: 20),
                AnasayfaTurlarWidget(serviceTitle: widget.serviceTitle),
                const SizedBox(height: 20),
              ],
            );
          } else if (state is ToursError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No campaigns available'));
        },
      ),
    );
  }
}
