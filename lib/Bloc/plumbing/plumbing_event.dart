part of 'plumbing_bloc.dart';

abstract class PlumbingEvent extends Equatable {
  const PlumbingEvent();

  @override
  List<Object> get props => [];
}

class AddPlumbing extends PlumbingEvent {
  final Users data;
  const AddPlumbing(this.data);
}

class ResetAddPlumbing extends PlumbingEvent {
  const ResetAddPlumbing();
}

class FetchPlumbing extends PlumbingEvent {
  const FetchPlumbing();
}
