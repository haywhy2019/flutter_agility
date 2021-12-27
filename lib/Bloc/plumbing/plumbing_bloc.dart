import 'dart:io';

import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/plumbing_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plumbing_event.dart';
part 'plumbing_state.dart';

class PlumbingBloc extends Bloc<PlumbingEvent, PlumbingState> {
  final PlumbingRepository _plumbingRepository;
  PlumbingBloc(this._plumbingRepository) : super(const PlumbingInitial()) {
    on<PlumbingEvent>((event, emit) async {
      if (event is AddPlumbing) {
        emit(const PlumbingLoading());
        try {
          final plumbing = await _plumbingRepository.addPlumbing(event.data);
          emit(PlumbingAdded(plumbing['name']));
        } on SocketException {
          emit(const PlumbingHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(PlumbingError(error));
        }
      }
      if (event is ResetAddPlumbing) {
        emit(const PlumbingInitial());
      }
      if (event is FetchPlumbing) {
        emit(const PlumbingLoading());
        try {
          final allPlumbing = await _plumbingRepository.fetchPlumbing();

          emit(PlumbingLoaded(allPlumbing));
        } on SocketException {
          emit(const PlumbingHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(PlumbingNoData(err.toString()));
          } else {
            emit(const PlumbingError("An Error Occured"));
          }
        }
      }
    });
  }
}
