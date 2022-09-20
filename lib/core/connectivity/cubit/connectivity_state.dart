part of 'connectivity_cubit.dart';

enum ConnectionType { wifi, mobile }

@immutable
abstract class ConnectivityState {}

class InternetLoading extends ConnectivityState {}

class InternetConnected extends ConnectivityState {
  final ConnectionType connectionType;

  InternetConnected({
    required this.connectionType,
  });
}

class InternetDisconnected extends ConnectivityState {}
