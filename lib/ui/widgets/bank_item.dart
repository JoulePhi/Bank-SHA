import 'package:bank_sha/models/payment_method_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;
  const BankItem({
    super.key,
    required this.paymentMethod,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected == true
              ? AppColors.lightBlueColor
              : AppColors.whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymentMethod.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: AppTextStyle.blackPoppins(16, FontWeight.w500),
              ),
              Text(
                paymentMethod.time.toString(),
                style: AppTextStyle.greyPoppins(12, FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
