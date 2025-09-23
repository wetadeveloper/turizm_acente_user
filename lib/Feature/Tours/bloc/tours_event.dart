import 'package:equatable/equatable.dart';

// ToursEvent abstract class which all events related to Campaign will extend
abstract class ToursEvent extends Equatable {
  const ToursEvent();

  @override
  List<Object> get props => [];
}

// Event to fetch tours
class FetchTours extends ToursEvent {
  final String serviceTitle;

  // Default değer tanımladık.
  const FetchTours([this.serviceTitle = 'hac_umre_turlari']);

  @override
  List<Object> get props => [serviceTitle];
}
