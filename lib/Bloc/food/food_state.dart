part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
  
  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {
  const FoodInitial();
  @override
  List<Object> get props => [];
}

class FoodLoading extends FoodState {
  const FoodLoading();
}

class FoodLoaded extends FoodState {
  final dynamic data;
  const FoodLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class FoodNoData extends FoodState {
  final String data;
  const FoodNoData(this.data);
  @override
  List<Object> get props => [data];
}

class FoodAdded extends FoodState {
  final String data;
  const FoodAdded(this.data);
  @override
  List<Object> get props => [data];
}

class FoodHttpError extends FoodState {
  final String message;
  const FoodHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class FoodError extends FoodState {
  final String message;
  const FoodError(this.message);
  @override
  List<Object> get props => [message];
}

