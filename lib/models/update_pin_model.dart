class UpdatePinModel {
  final String? previousPin;
  final String? newPin;
  UpdatePinModel({
    this.previousPin,
    this.newPin,
  });

  Map<String, dynamic> toJson() {
    return {
      'previous_pin': previousPin!,
      'new_pin': newPin!,
    };
  }
}
