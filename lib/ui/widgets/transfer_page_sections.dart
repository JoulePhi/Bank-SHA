import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/recent_user_item.dart';
import 'package:bank_sha/ui/widgets/result_item.dart';
import 'package:flutter/material.dart';

class RecentUserSection extends StatelessWidget {
  const RecentUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent User',
          style: AppTextStyle.blackPoppins(16, FontWeight.w600),
        ),
        AppUtils.spaceV(14),
        const RecentUserItem(
          name: 'Yonna Jie',
          imgUrl: 'assets/img_friend1.png',
          username: 'yoenna',
          isVerified: true,
        ),
        const RecentUserItem(
          name: 'John Hi',
          imgUrl: 'assets/img_friend2.png',
          username: 'johnhi',
        ),
        const RecentUserItem(
          name: 'Dzulfikar Sadid',
          imgUrl: 'assets/img_friend3.png',
          username: 'joulephi',
        ),
      ],
    );
  }
}

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: AppTextStyle.blackPoppins(16, FontWeight.w600),
        ),
        AppUtils.spaceV(14),
        Wrap(
          spacing: 17,
          runSpacing: 17,
          children: const [
            ResultItem(
              name: 'Yonna Jie',
              imgUrl: 'assets/img_friend1.png',
              username: 'yoenna',
              isVerified: true,
            ),
            ResultItem(
              name: 'John Hi',
              imgUrl: 'assets/img_friend2.png',
              username: 'johnhi',
              isSelected: true,
            ),
          ],
        ),
        AppUtils.spaceV(200),
        FilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, PagesName.transferAmountPage);
          },
        )
      ],
    );
  }
}
