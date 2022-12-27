import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String name, logoUrl;
  final bool isSelected;
  const BankItem({
    super.key,
    required this.name,
    required this.logoUrl,
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
          Image.asset(
            logoUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppTextStyle.blackPoppins(16, FontWeight.w500),
              ),
              Text(
                '50 mins',
                style: AppTextStyle.greyPoppins(12, FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
