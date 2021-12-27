import 'package:agility_app/Data/Models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ServiceRepository {
  /// Throws [NetworkException].
  Future addPlumbing(Users url);
}

class PlumbingRepository implements ServiceRepository {
  var url = Uri.parse(
      'https://agility-87280-default-rtdb.firebaseio.com/plumbing.json');
  @override
  Future addPlumbing(Users data) async {
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "name": data.name,
            "title": data.title,
            "phoneNumber": data.phoneNumber,
            "whatsApp": data.whatsApp,
            "description": data.description
          }));

      Map responseObj = json.decode(response.body);
      return responseObj;
    } catch (err) {
      rethrow;
    }
  }

  Future fetchPlumbing() async {
    try {
      final response = await http.get(url);
      if (response.body == "null") {
        throw response.body;
      }
      final responseDecode = json.decode(response.body) as Map<String, dynamic>;
      final List<Users> users = [];
      responseDecode.forEach((key, value) => {
            users.add(Users.fromJson(value, key)),
          });
      return users;
    } catch (err) {
      rethrow;
    }
  }
}

class NetworkException implements Exception {}
