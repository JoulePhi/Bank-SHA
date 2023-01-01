class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? time;

  PaymentMethodModel({
    this.id,
    this.name,
    this.thumbnail,
    this.code,
    this.time,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      thumbnail: json["thumbnail"],
      time: json["time"],
    );
  }
}
