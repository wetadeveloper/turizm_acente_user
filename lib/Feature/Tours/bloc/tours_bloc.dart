import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selamet/Feature/Tours/model/tours_model.dart';
import 'package:selamet/Feature/Tours/service/tours_service.dart';
import 'package:selamet/Feature/Tours/bloc/tours_event.dart';
import 'package:selamet/Feature/Tours/bloc/tours_state.dart';

class ToursBloc extends Bloc<ToursEvent, ToursState> {
  final ToursService _firestoreService;

  ToursBloc({required ToursService firestoreService})
      : _firestoreService = firestoreService,
        super(ToursInitial()) {
    on<FetchTours>(_onFetchTours);
  }

  Future<void> _onFetchTours(FetchTours event, Emitter<ToursState> emit) async {
    emit(ToursLoading());

    try {
      final List<ToursModel> tours = await _firestoreService.fetchTours(event.serviceTitle);
      emit(ToursLoaded(tours: tours));
    } catch (e) {
      emit(ToursError(message: 'Turlar yüklenirken bir hata oluştu: $e'));
    }
  }
}
