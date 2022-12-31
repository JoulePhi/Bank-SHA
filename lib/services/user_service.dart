import 'dart:convert';

import 'package:bank_sha/models/edit_profile_model.dart';
import 'package:bank_sha/models/update_pin_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(EditProfileModel data) async {
    try {
      final String token = await AuthService().getToken();
      final res = await http.put(
        Uri.https(SharedValues.baseUrl, 'api/users'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePin(UpdatePinModel data) async {
    try {
      final String token = await AuthService().getToken();
      final res = await http.put(
        Uri.https(SharedValues.baseUrl, 'api/wallets'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
