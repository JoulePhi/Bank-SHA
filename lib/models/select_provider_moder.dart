import 'package:bank_sha/models/data_plan_model.dart';

class ProviderModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  ProviderModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      thumbnail: json['thumbnail'],
      dataPlans: json['data_plans'] == null
          ? null
          : (json['data_plans'] as List)
              .map((data) => DataPlanModel.fromJson(data))
              .toList(),
    );
  }
}
