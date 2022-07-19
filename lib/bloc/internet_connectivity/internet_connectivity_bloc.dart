import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_connectivity_event.dart';
part 'internet_connectivity_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));
    on<InternetLossEvent>((event, emit) => emit(InternetLossState()));

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
