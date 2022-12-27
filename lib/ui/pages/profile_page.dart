import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_page_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBgColor,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: AppTextStyle.blackPoppins(20, FontWeight.w600),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, PagesName.homePage, (route) => false);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.fromLTRB(30, 22, 30, 0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/ic_check.png',
                      width: 28,
                    ),
                  ),
                ),
                AppUtils.spaceV(16),
                Text(
                  'Shayna Hanna',
                  style: AppTextStyle.blackPoppins(18, FontWeight.w500),
                ),
                AppUtils.spaceV(40),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_edit_profile.png',
                  title: 'Edit Profile',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, PagesName.pinPage) ==
                        true) {
                      Navigator.pushNamed(context, PagesName.profileEditPage);
                    }
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_my_pin.png',
                  title: 'My Pin',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, PagesName.pinPage) ==
                        true) {
                      Navigator.pushNamed(context, PagesName.pinEditPage);
                    }
                  },
                ),
                const ProfileMenuItem(
                    iconUrl: 'assets/ic_wallet_setting.png',
                    title: 'Wallet Settings'),
                const ProfileMenuItem(
                    iconUrl: 'assets/ic_my_rewards.png', title: 'My Rewards'),
                const ProfileMenuItem(
                    iconUrl: 'assets/ic_help_center.png', title: 'Help Center'),
                const ProfileMenuItem(
                    iconUrl: 'assets/ic_log_out.png', title: 'Log Out'),
              ],
            ),
          ),
          AppUtils.spaceV(40),
          const PlainButton(title: 'Report a Problem')
        ],
      ),
    );
  }
}
