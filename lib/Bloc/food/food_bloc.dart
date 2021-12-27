import 'dart:io';

import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/food_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository _foodRepository;
  FoodBloc(this._foodRepository) : super(const FoodInitial()) {
    on<FoodEvent>((event, emit) async {
      if (event is AddFood) {
        emit(const FoodLoading());
        try {
          final food = await _foodRepository.addFood(event.data);
          emit(FoodAdded(food['name']));
        } on SocketException {
          emit(const FoodHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(FoodError(error));
        }
      }
      if (event is ResetAddFood) {
        emit(const FoodInitial());
      }
      if (event is FetchFood) {
        emit(const FoodLoading());
        try {
          final allFood = await _foodRepository.fetchFood();

          emit(FoodLoaded(allFood));
        } on SocketException {
          emit(const FoodHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(FoodNoData(err.toString()));
          } else {
            emit(const FoodError("An Error Occured"));
          }
        }
      }
    });
  }
}
