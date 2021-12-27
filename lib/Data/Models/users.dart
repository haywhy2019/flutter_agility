// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Users extends Equatable {
  String id;
  String name;
  String title;
  String phoneNumber;
  String whatsApp;
  String image;
  String description;

  Users(
      {this.id = '',
      required this.name,
      required this.title,
      required this.phoneNumber,
      required this.whatsApp,
      this.image = "",
      required this.description});

  @override
  List<Object> get props =>
      [id, name, title, phoneNumber, whatsApp, description];

  factory Users.fromJson(Map<String, Object?> jsonMap, String id) {
    return Users(
      id: id,
      name: jsonMap['name'] as String,
      title: jsonMap['title'] as String,
      phoneNumber: jsonMap['phoneNumber'] as String,
      whatsApp: jsonMap['whatsApp'] as String,
      description: jsonMap['description'] as String,
    );
  }
}

// List<Users> data = [
//   Users(
//     id: "1",
//     name: "Dimeji Johnson",
//     title: "Software Engineer",
//     phoneNumber: 07064959292,
//     whatsApp: "dimeji@sasays.tech",
//     image: "assets/images/man.png",
//   ),
//   Users(
//     id: "2",
//     name: "Dimeji Johnson",
//     title: "Software Engineer",
//     phoneNumber: 07064959292,
//     whatsApp: "dimeji@sasays.tech",
//     image: "assets/images/man.png",
//   ),
//   Users(
//     id: "3",
//     name: "Dimeji Johnson",
//     title: "Software Engineer",
//     phoneNumber: 07064959292,
//     whatsApp: "dimeji@sasays.tech",
//     image: "assets/images/woman.png",
//   ),
// ];
