import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class SendAgainItem extends StatelessWidget {
  final String imgUrl, username;

  const SendAgainItem({
    super.key,
    required this.imgUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.cover,
                )),
          ),
          AppUtils.spaceV(13),
          Text(
            '@$username',
            style: AppTextStyle.blackPoppins(12, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
