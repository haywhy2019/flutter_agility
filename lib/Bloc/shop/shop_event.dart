part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class AddShop extends ShopEvent {
  final Users data;
  const AddShop(this.data);
}

class ResetAddShop extends ShopEvent {
 const  ResetAddShop();
}

class FetchShop extends ShopEvent {
 const  FetchShop();
}
