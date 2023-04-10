import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _internetSubsciption;
  InternetBloc() : super(InternetInitial()) {
    _internetSubsciption = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetConnected(
            internetType:
                result == ConnectivityResult.mobile ? "Mobile Data" : "Wifi"));
      }
    });
  }

  @override
  Future<void> close() {
    _internetSubsciption.cancel();
    return super.close();
  }
}
