import 'package:agility_app/Data/Models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ServiceRepository {
  /// Throws [NetworkException].
  Future addDelivery(Users url);
}

class DeliveryRepository implements ServiceRepository {
  var url = Uri.parse(
      'https://agility-87280-default-rtdb.firebaseio.com/delivery.json');
  @override
  Future addDelivery(Users data) async {
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

  Future fetchDelivery() async {
    try {
      final response = await http.get(url);

      // ignore: unnecessary_null_comparison
      if (response.body != "null") {
        final responseDecode =
            json.decode(response.body) as Map<String, dynamic>;
        final List<Users> users = [];
        responseDecode.forEach((key, value) => {
              users.add(Users.fromJson(value, key)),
            });
        return users;
      } else {
        throw response.body;
      }
    } catch (err) {
      rethrow;
    }
  }
}

class NetworkException implements Exception {}
