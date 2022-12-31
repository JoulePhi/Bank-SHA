import 'dart:convert';

import 'package:bank_sha/models/signup_model.dart';
import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http
          .post(Uri.https(SharedValues.baseUrl, 'api/is-email-exist'), body: {
        'email': email,
      });

      if (res.statusCode == 200) {
        return json.decode(res.body)['is_email_exist'];
      } else {
        return json.decode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpModel data) async {
    try {
      final res = await http.post(
        Uri.https(SharedValues.baseUrl, 'api/register'),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(json.decode(res.body));
        user = user.copyWith(password: data.password);
        return user;
      } else {
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
