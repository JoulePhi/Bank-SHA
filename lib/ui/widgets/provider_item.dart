import 'package:bank_sha/models/select_provider_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class ProviderItem extends StatelessWidget {
  final ProviderModel data;
  final bool isSelected;
  const ProviderItem({
    super.key,
    required this.data,
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
            data.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.name.toString(),
                style: AppTextStyle.blackPoppins(16, FontWeight.w500),
              ),
              Text(
                data.status.toString(),
                style: AppTextStyle.greyPoppins(12, FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
