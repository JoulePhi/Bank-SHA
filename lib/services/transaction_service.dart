import 'dart:convert';

import 'package:bank_sha/models/top_up_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> addAmount(TopUpModel data) async {
    try {
      String token = await AuthService().getToken();

      final res = await http.post(
        Uri.https(
          SharedValues.baseUrl,
          'api/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
