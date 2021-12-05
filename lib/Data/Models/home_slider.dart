import 'package:firebase_storage/firebase_storage.dart';
import 'package:equatable/equatable.dart';

class FirebaseFile extends Equatable{
  final Reference ref;
  final String name;
  final String url;
  final int index;
  final int length;

  const FirebaseFile(
      {required this.ref,
      required this.name,
      required this.url,
      required this.index,
      required this.length});
        @override
  List<Object> get props => [ref, name, url, index, length];
}