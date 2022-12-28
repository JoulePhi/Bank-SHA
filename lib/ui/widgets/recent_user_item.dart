import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class RecentUserItem extends StatelessWidget {
  final String imgUrl, name, username;
  final bool isVerified;

  const RecentUserItem({
    super.key,
    required this.name,
    required this.imgUrl,
    required this.username,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
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
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.blackPoppins(16, FontWeight.w500),
              ),
              Text(
                '@$username',
                style: AppTextStyle.greyPoppins(12, FontWeight.normal),
              ),
            ],
          ),
          const Spacer(),
          if (isVerified)
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
