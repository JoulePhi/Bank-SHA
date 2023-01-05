import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final UserModel data;
  final bool isSelected;

  const ResultItem({
    super.key,
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155 - 8,
      height: 173,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(color: AppColors.lightBlueColor, width: 2)
            : Border.all(color: AppColors.whiteColor),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(data.profilePicture.toString()),
              ),
            ),
            child: data.verified == 1
                ? Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/ic_check.png',
                      width: 16,
                    ),
                  )
                : null,
          ),
          AppUtils.spaceV(13),
          Text(
            data.name.toString(),
            style: AppTextStyle.blackPoppins(16, FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          AppUtils.spaceV(2),
          Text(
            '@${data.username}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.greyPoppins(11, FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
