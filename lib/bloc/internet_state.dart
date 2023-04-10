part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  final String internetType;

  const InternetConnected({this.internetType = "None"});

  @override
  List<Object> get props => [internetType];
}

class InternetDisconnected extends InternetState {}
