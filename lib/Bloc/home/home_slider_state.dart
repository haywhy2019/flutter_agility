// ignore_for_file: prefer_typing_uninitialized_variables

part of 'home_slider_bloc.dart';

@immutable
abstract class HomeSliderState {
  const HomeSliderState();
}

class HomeSliderInitial extends HomeSliderState {
  const HomeSliderInitial();
}

class HomeSliderLoading extends HomeSliderState {
  const HomeSliderLoading();
}

class HomeSliderLoaded extends HomeSliderState {
  final List<FirebaseFile> slider;
  const HomeSliderLoaded(this.slider);
}

class HomeSliderAdd extends HomeSliderState {
  
}

class HomeSliderError extends HomeSliderState {
  final String message;
  const HomeSliderError(this.message);
}
