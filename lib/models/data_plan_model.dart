class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorId;

  DataPlanModel({
    this.id,
    this.name,
    this.price,
    this.operatorId,
  });

  factory DataPlanModel.fromJson(Map<String, dynamic> json) {
    return DataPlanModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      operatorId: json['operator_card_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'operator_card_id': operatorId,
    };
  }
}
