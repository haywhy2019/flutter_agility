part of 'electrical_bloc.dart';

abstract class ElectricalEvent{}

class AddElectrical extends ElectricalEvent {
  final Users data;
  AddElectrical(this.data);
}

class ResetAddElectrical extends ElectricalEvent {
  ResetAddElectrical();
}

class FetchElectrical extends ElectricalEvent {
  FetchElectrical();
}