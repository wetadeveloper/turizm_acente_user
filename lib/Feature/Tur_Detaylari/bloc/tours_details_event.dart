import 'package:equatable/equatable.dart';

abstract class TurDetayEvent extends Equatable {
  const TurDetayEvent();

  @override
  List<Object> get props => [];
}

class LoadTurDetay extends TurDetayEvent {
  final Map<String, dynamic> turData;
  final String turID;

  const LoadTurDetay({
    required this.turData,
    required this.turID,
  });

  @override
  List<Object> get props => [turData, turID];
}
