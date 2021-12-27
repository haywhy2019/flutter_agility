part of 'delivery_bloc.dart';

abstract class DeliveryEvent {}

class AddDelivery extends DeliveryEvent {
  final Users data;
  AddDelivery(this.data);
}

class ResetAddDelivery extends DeliveryEvent {
  ResetAddDelivery();
}

class FetchDelivery extends DeliveryEvent {
  FetchDelivery();
}
