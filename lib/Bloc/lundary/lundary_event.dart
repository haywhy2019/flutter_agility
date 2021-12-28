part of 'lundary_bloc.dart';

abstract class LundaryEvent extends Equatable {
  const LundaryEvent();

  @override
  List<Object> get props => [];
}

class AddLundary extends LundaryEvent {
  final Users data;
  const AddLundary(this.data);
}

class ResetAddLundary extends LundaryEvent {
 const  ResetAddLundary();
}

class FetchLundary extends LundaryEvent {
 const FetchLundary();
}