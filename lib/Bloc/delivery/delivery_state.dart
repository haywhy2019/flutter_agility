part of 'delivery_bloc.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

class DeliveryInitial extends DeliveryState {
  const DeliveryInitial();
  @override
  List<Object> get props => [];
}

class DeliveryLoading extends DeliveryState {
  const DeliveryLoading();
}

class DeliveryLoaded extends DeliveryState {
  final dynamic data;
  const DeliveryLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class DeliveryNoData extends DeliveryState {
  final String data;
  const DeliveryNoData(this.data);
  @override
  List<Object> get props => [data];
}

class DeliveryAdded extends DeliveryState {
  final String data;
  const DeliveryAdded(this.data);
  @override
  List<Object> get props => [data];
}

class DeliveryHttpError extends DeliveryState {
  final String message;
  const DeliveryHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class DeliveryError extends DeliveryState {
  final String message;
  const DeliveryError(this.message);
  @override
  List<Object> get props => [message];
}
