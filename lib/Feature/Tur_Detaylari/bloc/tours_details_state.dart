import 'package:equatable/equatable.dart';
import 'package:selamet/Feature/Tur_Detaylari/model/tours_details_model.dart';

abstract class TurDetayState extends Equatable {
  const TurDetayState();

  @override
  List<Object> get props => [];
}

class TurDetayInitial extends TurDetayState {}

class TurDetayLoading extends TurDetayState {}

class TurDetayLoaded extends TurDetayState {
  final TurDetayModel tur;

  const TurDetayLoaded(this.tur);

  @override
  List<Object> get props => [tur];
}

class TurDetayError extends TurDetayState {
  final String message;

  const TurDetayError(this.message);

  @override
  List<Object> get props => [message];
}
