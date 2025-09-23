import 'package:equatable/equatable.dart';

abstract class TurDetayEvent extends Equatable {
  const TurDetayEvent();

  @override
  List<Object> get props => [];
}

class LoadTurDetay extends TurDetayEvent {
  final Map<String, dynamic> turData;
  final String acentaID;
  final String turID;

  const LoadTurDetay({
    required this.turData,
    required this.acentaID,
    required this.turID,
  });

  @override
  List<Object> get props => [turData, acentaID, turID];
}
