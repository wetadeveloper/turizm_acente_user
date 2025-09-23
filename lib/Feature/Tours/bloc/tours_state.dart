import 'package:equatable/equatable.dart';
import 'package:selamet/Feature/Tours/model/tours_model.dart';

abstract class ToursState extends Equatable {
  const ToursState();
  @override
  List<Object> get props => [];
}

class ToursInitial extends ToursState {}

class ToursLoading extends ToursState {}

class ToursLoaded extends ToursState {
  final List<Tours> tours;
  const ToursLoaded({required this.tours});
  @override
  List<Object> get props => [tours];
}

class ToursError extends ToursState {
  final String message;
  const ToursError({required this.message});
  @override
  List<Object> get props => [message];
}
