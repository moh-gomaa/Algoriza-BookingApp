import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  late StreamSubscription connectivityStreamSubscription;

  ConnectivityCubit() : super(InternetLoading()) {
    connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult != ConnectivityResult.none) {
        bool isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (isDeviceConnected &&
            (connectivityResult == ConnectivityResult.wifi))
          emit(InternetConnected(connectionType: ConnectionType.wifi));
        else if (isDeviceConnected &&
            (connectivityResult == ConnectivityResult.mobile))
          emit(InternetConnected(connectionType: ConnectionType.mobile));
      }
      else
        emit(InternetDisconnected());
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
