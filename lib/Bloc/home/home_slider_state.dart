// ignore_for_file: prefer_typing_uninitialized_variables

part of 'home_slider_bloc.dart';

@immutable
abstract class HomeSliderState extends Equatable{
  const HomeSliderState();
}

class HomeSliderInitial extends HomeSliderState {
  const HomeSliderInitial();

   @override
  List<Object> get props => [];
}

class HomeSliderLoading extends HomeSliderState {
  const HomeSliderLoading();
   @override
  List<Object> get props => [];
}

class HomeSliderLoaded extends HomeSliderState {
  final List<FirebaseFile> slider;
  const HomeSliderLoaded(this.slider);
   @override
  List<Object> get props => [slider];
}

class HomeSliderAdd extends HomeSliderState {
   @override
  List<Object> get props => [];
}

class HomeSliderHttpError extends HomeSliderState {
  final String message;
  const HomeSliderHttpError(this.message);
  @override
  List<Object> get props => [message];
}
class HomeSliderError extends HomeSliderState {
  final String message;
  const HomeSliderError(this.message);
   @override
  List<Object> get props => [message];
}
