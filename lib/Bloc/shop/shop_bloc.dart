import 'dart:io';

import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/shop_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository _shopRepository;
  ShopBloc(this._shopRepository) : super(const ShopInitial()) {
    on<ShopEvent>((event, emit) async {

       if (event is AddShop) {
        emit(const ShopLoading());
        try {
          final shop = await _shopRepository.addShop(event.data);
          emit(ShopAdded(shop['name']));
        } on SocketException {
          emit(const ShopHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(ShopError(error));
        }
      }
      if (event is ResetAddShop) {
        emit(const ShopInitial());
      }
      if (event is FetchShop) {
        emit(const ShopLoading());
        try {
          final allShop = await _shopRepository.fetchShop();

          emit(ShopLoaded(allShop));
        } on SocketException {
          emit(const ShopHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(ShopNoData(err.toString()));
          } else {
            emit(const ShopError("An Error Occured"));
          }
        }
      }
    });
  }
}
