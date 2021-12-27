import 'dart:io';
import 'package:agility_app/Data/Models/users.dart';
import 'package:agility_app/Data/Repositiory/electrical_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'electrical_event.dart';
part 'electrical_state.dart';

class ElectricalBloc extends Bloc<ElectricalEvent, ElectricalState> {
  final ElectricalRepository _electricalRepository;
  ElectricalBloc(this._electricalRepository)
      : super(const ElectricalInitial()) {
    on<ElectricalEvent>((event, emit) async {
      if (event is AddElectrical) {
        emit(const ElectricalLoading());
        try {
          final electrical =
              await _electricalRepository.addElectrical(event.data);
          emit(ElectricalAdded(electrical['name']));
        } on SocketException {
          emit(const ElectricalHttpError("No Internet Connection"));
        } catch (err) {
          String error = "An Error Occured";
          emit(ElectricalError(error));
        }
      }
      if (event is ResetAddElectrical) {
        emit(const ElectricalInitial());
      }
      if (event is FetchElectrical) {
        emit(const ElectricalLoading());
        try {
          final allElectrical = await _electricalRepository.fetchEElectrical();

          emit(ElectricalLoaded(allElectrical));
        } on SocketException {
          emit(const ElectricalHttpError("No Internet Connection"));
        } catch (err) {
          if (err == "null") {
            emit(ElectricalNoData(err.toString()));
          } else {
            emit(const ElectricalError("An Error Occured"));
          }
        }
      }
    });
  }
}
