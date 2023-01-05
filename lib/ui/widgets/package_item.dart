import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel data;
  final bool isSelected;

  const PackageItem({
    super.key,
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 171,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(color: AppColors.lightBlueColor, width: 2)
            : null,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.name.toString(),
              style: AppTextStyle.blackPoppins(32, FontWeight.w500),
            ),
            AppUtils.spaceV(6),
            Text(
              AppUtils.formatCurrency(data.price ?? 0),
              style: AppTextStyle.greyPoppins(12, FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
