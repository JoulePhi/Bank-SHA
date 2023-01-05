import 'package:bank_sha/models/user_moder.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class SendAgainItem extends StatelessWidget {
  final UserModel? data;

  const SendAgainItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 6),
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
                  image: data!.profilePicture == null
                      ? const AssetImage('assets/image_profile.png')
                      : (NetworkImage(data!.profilePicture!)) as ImageProvider,
                  fit: BoxFit.cover,
                )),
          ),
          AppUtils.spaceV(13),
          Text(
            '@${data!.username!}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.blackPoppins(12, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
