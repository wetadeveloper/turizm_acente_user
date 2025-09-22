import 'package:equatable/equatable.dart';
import 'package:selamet/Campaings/model/campaign.dart';

abstract class CampaignState extends Equatable {
  const CampaignState();
  @override
  List<Object> get props => [];
}

class CampaignInitial extends CampaignState {}

class CampaignLoading extends CampaignState {}

class CampaignLoaded extends CampaignState {
  final List<Campaign> campaigns;
  const CampaignLoaded({required this.campaigns});
  @override
  List<Object> get props => [campaigns];
}

class CampaignError extends CampaignState {
  final String message;
  const CampaignError({required this.message});
  @override
  List<Object> get props => [message];
}
