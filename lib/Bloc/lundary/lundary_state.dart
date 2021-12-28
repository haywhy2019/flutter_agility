part of 'lundary_bloc.dart';

abstract class LundaryState extends Equatable {
  const LundaryState();
  
  @override
  List<Object> get props => [];
}

class LundaryInitial extends LundaryState {
  const LundaryInitial();
  @override
  List<Object> get props => [];
}

class LundaryLoading extends LundaryState {
  const LundaryLoading();
}

class LundaryLoaded extends LundaryState {
  final dynamic data;
  const LundaryLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class LundaryNoData extends LundaryState {
  final String data;
  const LundaryNoData(this.data);
  @override
  List<Object> get props => [data];
}

class LundaryAdded extends LundaryState {
  final String data;
  const LundaryAdded(this.data);
  @override
  List<Object> get props => [data];
}

class LundaryHttpError extends LundaryState {
  final String message;
  const LundaryHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class LundaryError extends LundaryState {
  final String message;
  const LundaryError(this.message);
  @override
  List<Object> get props => [message];
}

