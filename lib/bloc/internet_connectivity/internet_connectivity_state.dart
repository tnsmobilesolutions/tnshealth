part of 'internet_connectivity_bloc.dart';

abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainState extends InternetState {}

class InternetLossState extends InternetState {}
