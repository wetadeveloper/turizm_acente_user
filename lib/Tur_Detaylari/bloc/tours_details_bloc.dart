import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selamet/Tur_Detaylari/bloc/tours_details_event.dart';
import 'package:selamet/Tur_Detaylari/bloc/tours_details_state.dart';
import 'package:selamet/Tur_Detaylari/model/tours_details_model.dart';
import '../service/tur_detay_repository.dart';

class TurDetayBloc extends Bloc<TurDetayEvent, TurDetayState> {
  final TurDetayRepository repository;

  TurDetayBloc(this.repository) : super(TurDetayInitial()) {
    on<LoadTurDetay>(_onLoadTurDetay);
  }

  Future<void> _onLoadTurDetay(LoadTurDetay event, Emitter<TurDetayState> emit) async {
    emit(TurDetayLoading());
    try {
      final images = await repository.getTurImages(event.acentaID, event.turID);
      final model = TurDetayModel.fromMap(event.turData);
      emit(TurDetayLoaded(model.copyWith(imageUrls: images)));
    } catch (e) {
      emit(
        TurDetayError(
          e.toString(),
        ),
      );
    }
  }
}
