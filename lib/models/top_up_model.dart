class TopUpModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  const TopUpModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopUpModel copyWith(
      {String? amount, String? pin, String? paymentMethodCode}) {
    return TopUpModel(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'pin': pin,
      'payment_method_code': paymentMethodCode,
    };
  }
}
