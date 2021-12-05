import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_add_slider_event.dart';
part 'home_add_slider_state.dart';

class HomeAddSliderBloc extends Bloc<HomeAddSliderEvent, HomeAddSliderState> {
  HomeAddSliderBloc() : super(HomeAddSliderInitial()) {
    on<HomeAddSliderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
