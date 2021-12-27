import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/delivery_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryRepository _deliveryRepository;
  DeliveryBloc(this._deliveryRepository) : super(const DeliveryInitial()) {
    on<DeliveryEvent>((event, emit) async {
      if (event is AddDelivery) {
        emit(const DeliveryLoading());
        try {
          final delivery = await _deliveryRepository.addDelivery(event.data);
          emit(DeliveryAdded(delivery['name']));
        } on SocketException {
          emit(const DeliveryHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(DeliveryError(error));
        }
      }
      if (event is ResetAddDelivery) {
        emit(const DeliveryInitial());
      }
      if (event is FetchDelivery) {
        emit(const DeliveryLoading());
        try {
          final allDelivery = await _deliveryRepository.fetchDelivery();

          emit(DeliveryLoaded(allDelivery));
        } on SocketException {
          emit(const DeliveryHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(DeliveryNoData(err.toString()));
          } else {
            emit(const DeliveryError("An Error Occured"));
          }
        }
      }
    });
  }
}
