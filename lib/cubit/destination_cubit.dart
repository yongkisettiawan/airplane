import 'package:airplane/services/destinations_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/destination_model.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destinations =
          await DestinationsService().fatchDestinations();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
