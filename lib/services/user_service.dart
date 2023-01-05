import 'dart:convert';

import 'package:bank_sha/models/edit_profile_model.dart';
import 'package:bank_sha/models/friendly_tips_modle.dart';
import 'package:bank_sha/models/update_pin_model.dart';
import 'package:bank_sha/models/user_moder.dart';
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

  Future<List<UserModel>> getUserByUsername(String name) async {
    try {
      String token = await AuthService().getToken();
      final res = await http
          .get(Uri.https(SharedValues.baseUrl, 'api/users/$name'), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (e) => UserModel.fromJson(e),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUser() async {
    try {
      String token = await AuthService().getToken();
      final res = await http.get(
        Uri.https(SharedValues.baseUrl, 'api/transfer_histories'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (e) => UserModel.fromJson(e),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> sendAgain() async {
    try {
      String token = await AuthService().getToken();
      final res = await http.get(
          Uri.https(
              SharedValues.baseUrl, 'api/transfer_histories', {'limit': '10'}),
          headers: {
            'Authorization': token,
          });
      if (res.statusCode == 200) {
        return List<UserModel>.from(
            jsonDecode(res.body)['data'].map((e) => UserModel.fromJson(e)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FriendlyTipsModel>> getTips() async {
    try {
      String token = await AuthService().getToken();
      final res = await http.get(
          Uri.https(
            SharedValues.baseUrl,
            'api/tips',
          ),
          headers: {
            'Authorization': token,
          });
      if (res.statusCode == 200) {
        return List<FriendlyTipsModel>.from(jsonDecode(res.body)['data']
            .map((e) => FriendlyTipsModel.fromJson(e)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
