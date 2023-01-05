import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class RecentUserItem extends StatelessWidget {
  final UserModel data;
  final bool isSelected;

  const RecentUserItem({
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
        border: isSelected
            ? Border.all(color: AppColors.lightBlueColor, width: 2)
            : Border.all(color: AppColors.whiteColor),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(data.profilePicture.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name.toString(),
                style: AppTextStyle.blackPoppins(16, FontWeight.w500),
              ),
              Text(
                '@${data.username}',
                style: AppTextStyle.greyPoppins(12, FontWeight.normal),
              ),
            ],
          ),
          const Spacer(),
          if (data.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.darkGreenColor,
                  size: 14,
                ),
                AppUtils.spaceH(4),
                Text(
                  'Verified',
                  style: AppTextStyle.greenPoppins(11, FontWeight.w500),
                )
              ],
            )
        ],
      ),
    );
  }
}
