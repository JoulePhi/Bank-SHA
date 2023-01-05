class DataPostModel {
  final String? dataPlanId, phoneNumber, pin;

  DataPostModel({
    this.dataPlanId,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': dataPlanId,
      'phone_number': phoneNumber,
      'pin': pin,
    };
  }

  DataPostModel copyWith(
      {String? dataPlanId, String? phoneNumber, String? pin}) {
    return DataPostModel(
      dataPlanId: dataPlanId ?? this.dataPlanId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pin: pin ?? this.pin,
    );
  }
}
