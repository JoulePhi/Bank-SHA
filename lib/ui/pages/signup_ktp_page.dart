import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignupKtpPage extends StatelessWidget {
  const SignupKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sha_logo_light.png'))),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: AppTextStyle.blackPoppins(20, FontWeight.w600),
          ),
          AppUtils.spaceV(20),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightBgColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icon_upload.png',
                      width: 32,
                    ),
                  ),
                ),
                AppUtils.spaceV(16),
                Text(
                  'Passport/ID Card',
                  style: AppTextStyle.blackPoppins(18, FontWeight.w500),
                ),
                AppUtils.spaceV(50),
                FilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, PagesName.signupSuccessPage);
                  },
                )
              ],
            ),
          ),
          AppUtils.spaceV(40),
          PlainButton(
            title: 'Skip For Now',
            onPressed: () {
              Navigator.pushNamed(context, PagesName.signupSuccessPage);
            },
          )
        ],
      ),
    );
  }
}
