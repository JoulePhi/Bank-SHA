import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:flutter/material.dart';

class LatestTracItem extends StatelessWidget {
  final String iconUrl, title, date, value;

  const LatestTracItem({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.date,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          AppUtils.spaceH(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                ),
                Text(
                  date,
                  style: AppTextStyle.greyPoppins(12, FontWeight.normal),
                )
              ],
            ),
          ),
          Text(
            value,
            style: AppTextStyle.blackPoppins(16, FontWeight.w500),
          )
        ],
      ),
    );
  }
}
