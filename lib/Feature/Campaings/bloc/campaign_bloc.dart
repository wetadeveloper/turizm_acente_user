import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selamet/Feature/Campaings/bloc/campaign_event.dart';
import 'package:selamet/Feature/Campaings/bloc/campaign_state.dart';
import 'package:selamet/Feature/Campaings/model/campaign.dart';
import 'package:selamet/Feature/Campaings/service/campaigns_service.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final CampaingsService _firestoreService;

  CampaignBloc({required CampaingsService firestoreService})
      : _firestoreService = firestoreService,
        super(CampaignInitial()) {
    on<FetchCampaigns>(_onFetchCampaigns);
  }

  void _onFetchCampaigns(FetchCampaigns event, Emitter<CampaignState> emit) async {
    emit(CampaignLoading());
    try {
      List<Campaign> campaigns = await _firestoreService.fetchCampaigns();
      emit(CampaignLoaded(campaigns: campaigns));
    } catch (e) {
      emit(CampaignError(message: 'Failed to fetch campaigns: $e'));
    }
  }
}
