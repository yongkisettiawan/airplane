import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/destination_model.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());
}
