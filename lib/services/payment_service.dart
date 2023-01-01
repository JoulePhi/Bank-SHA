import 'dart:convert';

import 'package:bank_sha/models/payment_method_moder.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      String token = await AuthService().getToken();
      final res = await http.get(
          Uri.https(SharedValues.baseUrl, 'api/payment_methods'),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body)
            .map((e) => PaymentMethodModel.fromJson(e))
            .toList());
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
