import 'dart:convert';
import 'package:bank_sha/models/signin_model.dart';
import 'package:bank_sha/models/signup_model.dart';
import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
        await saveCredential(user);
        return user;
      } else {
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInModel data) async {
    try {
      final res = await http.post(
        Uri.https(SharedValues.baseUrl, 'api/login'),
        body: data.toJson(),
      );
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(json.decode(res.body));
        user = user.copyWith(password: data.password);
        await saveCredential(user);
        return user;
      } else {
        throw json.decode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final String token = await getToken();
      final res = await http.post(
        Uri.https(SharedValues.baseUrl, 'api/logout'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        await clearStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveCredential(UserModel data) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'email', value: data.email);
      await storage.write(key: 'password', value: data.password);
      await storage.write(key: 'token', value: data.token);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInModel> loadCredential() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> data = await storage.readAll();

      if (data['email'] == null || data['password'] == null) {
        throw 'Unauthenticated';
      } else {
        final SignInModel user = SignInModel(
          email: data['email'],
          password: data['password'],
        );
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }
    return token;
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
