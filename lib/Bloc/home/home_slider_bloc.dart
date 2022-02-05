import 'dart:io';
import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:agility_app/Data/Repositiory/home_slider_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
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
          if (slider.isEmpty) {
            emit(const HomeSliderInitial());
          } else {
            emit(HomeSliderLoaded(slider));
          }
        } on SocketException {
          emit(const HomeSliderHttpError("No Internet Connection"));
        } on FirebaseException {
          emit(const HomeSliderHttpError("No Internet Connection"));
        } catch (err) {
          emit(const HomeSliderError("An Error Occured"));
        }
      }
    });
  }
}
