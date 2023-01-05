class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? time;
  final String? action;

  TransactionTypeModel({
    this.id,
    this.name,
    this.thumbnail,
    this.code,
    this.time,
    this.action,
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) {
    return TransactionTypeModel(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      thumbnail: json["thumbnail"],
      time: json["time"],
      action: json["action"],
    );
  }
}
