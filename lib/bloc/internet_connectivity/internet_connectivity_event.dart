part of 'internet_connectivity_bloc.dart';

abstract class InternetEvent {}

class InternetGainEvent extends InternetEvent {}

class InternetLossEvent extends InternetEvent {}
