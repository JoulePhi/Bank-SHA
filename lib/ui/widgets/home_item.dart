import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback? onTap;
  const HomeItem({
    super.key,
    required this.title,
    required this.iconUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 26,
              ),
            ),
          ),
          AppUtils.spaceV(8),
          Text(
            title,
            style: AppTextStyle.blackPoppins(14, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
