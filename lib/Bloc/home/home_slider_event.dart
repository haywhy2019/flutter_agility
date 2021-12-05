part of 'home_slider_bloc.dart';

@immutable
abstract class HomeSliderEvent {}

class GetSlider extends HomeSliderEvent {
  final String folder;

  GetSlider(this.folder);
}