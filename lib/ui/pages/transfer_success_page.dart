import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Berhasil Transfer',
              style: AppTextStyle.blackPoppins(20, FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            AppUtils.spaceV(26),
            Text(
              'Use the money wisely and\ngrow your finance',
              style: AppTextStyle.greyPoppins(16, FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            AppUtils.spaceV(50),
            MyFilledButton(
              title: 'Back To Home',
              width: 230,
              onPressed: (() {
                Navigator.pushNamedAndRemoveUntil(
                    context, PagesName.homePage, (route) => false);
              }),
            )
          ],
        ),
      ),
    );
  }
}
