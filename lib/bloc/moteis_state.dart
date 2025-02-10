part of 'moteis_bloc.dart';


sealed class MoteisState {}

final class MoteisInitialState extends MoteisState {}
final class MoteisSuccessState extends MoteisState {
  final List<MotelModel> moteis;
  MoteisSuccessState({required this.moteis});
}

final class MoteisFailureState extends MoteisState {
  final String error;
  MoteisFailureState(this.error);
}

final class MoteisLoadingState extends MoteisState {}