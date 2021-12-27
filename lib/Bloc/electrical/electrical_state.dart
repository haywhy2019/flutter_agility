part of 'electrical_bloc.dart';

abstract class ElectricalState extends Equatable {
  const ElectricalState();
  
  @override
  List<Object> get props => [];
}

class ElectricalInitial extends ElectricalState {
  const ElectricalInitial();
  @override
  List<Object> get props => [];
}

class ElectricalLoading extends ElectricalState {
  const ElectricalLoading();
}

class ElectricalLoaded extends ElectricalState {
  final dynamic data;
  const ElectricalLoaded(this.data);
  @override
  List<Object> get props => [data];
}


class ElectricalNoData extends ElectricalState {
  final String data;
  const ElectricalNoData(this.data);
  @override
  List<Object> get props => [data];
}

class ElectricalAdded extends ElectricalState {
  final String data;
  const ElectricalAdded(this.data);
  @override
  List<Object> get props => [data];
}

class ElectricalHttpError extends ElectricalState {
  final String message;
  const ElectricalHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class ElectricalError extends ElectricalState {
  final String message;
  const ElectricalError(this.message);
  @override
  List<Object> get props => [message];
}
