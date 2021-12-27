import 'dart:io';
import 'dart:async';

import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/fashion_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fashion_event.dart';
part 'fashion_state.dart';

class FashionBloc extends Bloc<FashionEvent, FashionState> {
  final FashionRepository _fashionRepository;
  FashionBloc(this._fashionRepository) : super(const FashionInitial()) {
    on<FashionEvent>((event, emit) async {
      if (event is AddFashion) {
        emit(const FashionLoading());
        try {
          final fashion = await _fashionRepository.addFashion(event.data);
          emit(FashionAdded(fashion['name']));
        } on SocketException {
          emit(const FashionHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(FashionError(error));
        }
      }
      if (event is ResetAddFashion) {
        emit(const FashionInitial());
      }
      if (event is FetchFashion) {
        emit(const FashionLoading());
        try {
          final allFashion = await _fashionRepository.fetchFashion();

          emit(FashionLoaded(allFashion));
        } on SocketException {
          emit(const FashionHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(FashionNoData(err.toString()));
          } else {
            emit(const FashionError("An Error Occured"));
          }
        }
      }
    });
  }
}
