part of 'plumbing_bloc.dart';

abstract class PlumbingState extends Equatable {
  const PlumbingState();
  
  @override
  List<Object> get props => [];
}

class PlumbingInitial extends PlumbingState {
  const PlumbingInitial();
  @override
  List<Object> get props => [];
}

class PlumbingLoading extends PlumbingState {
  const PlumbingLoading();
}

class PlumbingLoaded extends PlumbingState {
  final dynamic data;
  const PlumbingLoaded(this.data);
  @override
  List<Object> get props => [data];
}


class PlumbingNoData extends PlumbingState {
  final String data;
  const PlumbingNoData(this.data);
  @override
  List<Object> get props => [data];
}

class PlumbingAdded extends PlumbingState {
  final String data;
  const PlumbingAdded(this.data);
  @override
  List<Object> get props => [data];
}

class PlumbingHttpError extends PlumbingState {
  final String message;
  const PlumbingHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class PlumbingError extends PlumbingState {
  final String message;
  const PlumbingError(this.message);
  @override
  List<Object> get props => [message];
}
