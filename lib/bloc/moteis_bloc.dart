import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go/data/repository/moteis_repository.dart';
import 'package:guia_de_moteis_go/models/motel_model.dart';
part 'moteis_event.dart';
part 'moteis_state.dart';

class MoteisBloc extends Bloc<MoteisEvent, MoteisState>{
  MoteisRepository moteisRepository;

  MoteisBloc(this.moteisRepository): super(MoteisInitialState()){
    on<MoteisFetchedEvent>(_getMoteisList);
  }

  void _getMoteisList(MoteisFetchedEvent event, Emitter<MoteisState> emit) async {
    emit(MoteisLoadingState());
    final moteis = await moteisRepository.getMoteisList();
    emit(MoteisSuccessState(moteis: moteis));
    try {
      final moteis = await moteisRepository.getMoteisList();
      emit(MoteisSuccessState(moteis: moteis));
    } catch (e) {
      emit(MoteisFailureState(e.toString()));
    }
  }
}