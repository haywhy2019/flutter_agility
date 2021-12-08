import 'dart:io';

import 'package:agility_app/Data/Models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ServiceRepository {
  /// Throws [NetworkException].
  Future addFashion(Users url);
}

class FashionRepository implements ServiceRepository {
  var url = Uri.parse(
      'https://agility-87280-default-rtdb.firebaseio.com/fashion.json');
  @override
  Future addFashion(Users data) async {
    // Simulate network delay
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "name": data.name,
            "title": data.title,
            "phoneNumber": data.phoneNumber,
            "whatsApp": data.whatsApp,
          }));

      Map responseObj = json.decode(response.body);
      return responseObj;
    } catch (err) {
      rethrow;
    }
  }

  Future fetchFashion() async {
    try {
      return await http.get(url);
    } catch (err) {
      return "An Error Occured";
    }
  }
}

class NetworkException implements Exception {}
