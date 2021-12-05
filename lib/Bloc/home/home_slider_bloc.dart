import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:agility_app/Data/Repositiory/home_slider_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_slider_event.dart';
part 'home_slider_state.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, HomeSliderState> {
  final HomeRepository _homeRepository;
  HomeSliderBloc(this._homeRepository) : super(const HomeSliderInitial()) {
    on<HomeSliderEvent>((event, emit) async {

      if (event is GetSlider) {
        try {
          final slider = await _homeRepository.listAll(event.folder);
          emit(HomeSliderLoaded(slider));
        } catch (err) {
          emit(const HomeSliderError("An Error Occured"));
        }
      }
    });
  }
}
