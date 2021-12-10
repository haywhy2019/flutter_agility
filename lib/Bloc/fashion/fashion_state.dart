part of 'fashion_bloc.dart';

abstract class FashionState extends Equatable {
  const FashionState();

  @override
  List<Object> get props => [];
}

class FashionInitial extends FashionState {
  const FashionInitial();
  @override
  List<Object> get props => [];
}

class FashionLoading extends FashionState {
  const FashionLoading();
}

class FashionLoaded extends FashionState {
  final dynamic data;
  const FashionLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class FashionAdded extends FashionState {
  final String data;
  const FashionAdded(this.data);
  @override
  List<Object> get props => [data];
}

class FashionHttpError extends FashionState {
  final String message;
  const FashionHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class FashionError extends FashionState {
  final String message;
  const FashionError(this.message);
  @override
  List<Object> get props => [message];
}
