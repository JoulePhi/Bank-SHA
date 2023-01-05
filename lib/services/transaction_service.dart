import 'dart:convert';
import 'package:bank_sha/models/data_post_model.dart';
import 'package:bank_sha/models/latest_transaction_model.dart';
import 'package:bank_sha/models/select_provider_moder.dart';
import 'package:bank_sha/models/top_up_model.dart';
import 'package:bank_sha/models/transfer_model.dart';
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

  Future<void> transfer(TransferModel data) async {
    try {
      String token = await AuthService().getToken();

      final res = await http.post(
        Uri.https(
          SharedValues.baseUrl,
          'api/transfers',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProviderModel>> getProviders() async {
    try {
      String token = await AuthService().getToken();
      final res = await http.get(
        Uri.https(SharedValues.baseUrl, 'api/operator_cards'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        final result = List<ProviderModel>.from(
            jsonDecode(res.body)['data'].map((e) => ProviderModel.fromJson(e)));

        return result;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> buyDataPlan(DataPostModel data) async {
    try {
      String token = await AuthService().getToken();
      final res = await http.post(
        Uri.https(SharedValues.baseUrl, 'api/data_plans'),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LatestTransactionModel>> getLatestTransaction() async {
    try {
      final String token = await AuthService().getToken();

      final res = await http.get(
        Uri.https(SharedValues.baseUrl, 'api/transactions', {'limit': '5'}),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<LatestTransactionModel>.from(jsonDecode(res.body)['data']
            .map((e) => LatestTransactionModel.fromJson(e)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
