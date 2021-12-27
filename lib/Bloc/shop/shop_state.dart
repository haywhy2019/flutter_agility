part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();
  
  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {
  const ShopInitial();
  @override
  List<Object> get props => [];
}

class ShopLoading extends ShopState {
  const ShopLoading();
}

class ShopLoaded extends ShopState {
  final dynamic data;
  const ShopLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class ShopNoData extends ShopState {
  final String data;
  const ShopNoData(this.data);
  @override
  List<Object> get props => [data];
}

class ShopAdded extends ShopState {
  final String data;
  const ShopAdded(this.data);
  @override
  List<Object> get props => [data];
}

class ShopHttpError extends ShopState {
  final String message;
  const ShopHttpError(this.message);
  @override
  List<Object> get props => [message];
}

class ShopError extends ShopState {
  final String message;
  const ShopError(this.message);
  @override
  List<Object> get props => [message];
}
