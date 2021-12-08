part of 'fashion_bloc.dart';

abstract class FashionEvent {}

class AddFashion extends FashionEvent {
  final Users data;
  AddFashion(this.data);
}

class ResetAddFashion extends FashionEvent {
  ResetAddFashion();
}

class FetchFashion extends FashionEvent {
  FetchFashion();
}
