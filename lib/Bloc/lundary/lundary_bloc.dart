import 'dart:io';

import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/lundary_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lundary_event.dart';
part 'lundary_state.dart';

class LundaryBloc extends Bloc<LundaryEvent, LundaryState> {
  final LundaryRepository _lundaryRepository;
  LundaryBloc(this._lundaryRepository) : super(const LundaryInitial()) {
    on<LundaryEvent>((event, emit) async {
      if (event is AddLundary) {
        emit(const LundaryLoading());
        try {
          final lundary = await _lundaryRepository.addLundary(event.data);
          emit(LundaryAdded(lundary['name']));
        } on SocketException {
          emit(const LundaryHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(LundaryError(error));
        }
      }
      if (event is ResetAddLundary) {
        emit(const LundaryInitial());
      }
      if (event is FetchLundary) {
        emit(const LundaryLoading());
        try {
          final allLundary = await _lundaryRepository.fetchLundary();

          emit(LundaryLoaded(allLundary));
        } on SocketException {
          emit(const LundaryHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(LundaryNoData(err.toString()));
          } else {
            emit(const LundaryError("An Error Occured"));
          }
        }
      }
    });
  }
}
