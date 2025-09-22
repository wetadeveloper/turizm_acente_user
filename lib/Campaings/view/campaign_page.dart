import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selamet/Campaings/bloc/campaign_bloc.dart';
import 'package:selamet/Campaings/bloc/campaign_event.dart';
import 'package:selamet/Campaings/bloc/campaign_state.dart';
import '../widgets/campaigns_card.dart';

class CampaignsPage extends StatefulWidget {
  const CampaignsPage({super.key});

  @override
  CampaignsPageState createState() => CampaignsPageState();
}

class CampaignsPageState extends State<CampaignsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<CampaignBloc>().add(FetchCampaigns());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kampanyalar'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CampaignBloc, CampaignState>(
        builder: (context, state) {
          if (state is CampaignLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CampaignLoaded) {
            return ListView.builder(
              itemCount: state.campaigns.length,
              itemBuilder: (context, index) {
                var campaign = state.campaigns[index];
                return CampaignCard(campaign: campaign);
              },
            );
          } else if (state is CampaignError) {
            return Center(
              child: Text('Hata: ${state.message}'),
            );
          }
          return const Center(
            child: Text('Bir hata oluştu'),
          );
        },
      ),
    );
  }
}
