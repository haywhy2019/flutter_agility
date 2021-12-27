part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}


class AddFood extends FoodEvent {
  final Users data;
 const AddFood(this.data);
}

class ResetAddFood extends FoodEvent {
 const ResetAddFood();
}

class FetchFood extends FoodEvent {
 const FetchFood();
}