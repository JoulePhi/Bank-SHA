import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/friendly_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_item.dart';
import 'package:bank_sha/ui/widgets/latest_trac_item.dart';
import 'package:bank_sha/ui/widgets/send_again_item.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: AppTextStyle.greyPoppins(16, FontWeight.normal),
              ),
              Text(
                'Shaynahan',
                style: AppTextStyle.blackPoppins(20, FontWeight.w600),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PagesName.profilePage);
            },
            child: Container(
              width: 60,
              height: 60,
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
                  width: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage('assets/img_card_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shayna Hanna',
            style: AppTextStyle.whitePoppins(18, FontWeight.w500),
          ),
          AppUtils.spaceV(28),
          Text(
            '****  ****  ****  1280',
            style: AppTextStyle.whitePoppins(18, FontWeight.w500).copyWith(
              letterSpacing: 3,
            ),
          ),
          AppUtils.spaceV(21),
          Text(
            'Balance',
            style: AppTextStyle.whitePoppins(14, FontWeight.normal),
          ),
          Text(
            AppUtils.formatCurrency(12500),
            style: AppTextStyle.whitePoppins(24, FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class LevelSection extends StatelessWidget {
  const LevelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: AppTextStyle.blackPoppins(14, FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '55%',
                style: AppTextStyle.greenPoppins(14, FontWeight.w600),
              ),
              Text(
                ' of ${AppUtils.formatCurrency(20000)}',
                style: AppTextStyle.blackPoppins(14, FontWeight.w600),
              ),
            ],
          ),
          AppUtils.spaceV(10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: .55,
              valueColor: AlwaysStoppedAnimation(AppColors.darkGreenColor),
              backgroundColor: AppColors.lightBgColor,
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemSection extends StatelessWidget {
  const MenuItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeItem(
                title: 'Top Up',
                iconUrl: 'assets/ic_topup.png',
                onTap: () {
                  Navigator.pushNamed(context, PagesName.topupPage);
                },
              ),
              HomeItem(
                title: 'Send',
                iconUrl: 'assets/ic_send.png',
                onTap: () {
                  Navigator.pushNamed(context, PagesName.transferPage);
                },
              ),
              HomeItem(
                title: 'Withdraw',
                iconUrl: 'assets/ic_withdraw.png',
                onTap: () {},
              ),
              HomeItem(
                title: 'More',
                iconUrl: 'assets/ic_more.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const ModalDialog());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ModalDialog extends StatelessWidget {
  const ModalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width - 24,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.lightBgColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: AppTextStyle.blackPoppins(16, FontWeight.w600),
            ),
            AppUtils.spaceV(13),
            Wrap(
              spacing: 19,
              runSpacing: 29,
              children: [
                HomeItem(
                  title: 'Data',
                  iconUrl: 'assets/ic_modal_data.png',
                  onTap: () {
                    Navigator.pushNamed(context, PagesName.providerPage);
                  },
                ),
                HomeItem(
                  title: 'Water',
                  iconUrl: 'assets/ic_modal_droplet.png',
                  onTap: () {
                    // Navigator.pushNamed(context, PagesName.topupPage);
                  },
                ),
                HomeItem(
                  title: 'Stream',
                  iconUrl: 'assets/ic_modal_stream.png',
                  onTap: () {
                    // Navigator.pushNamed(context, PagesName.topupPage);
                  },
                ),
                HomeItem(
                  title: 'Movie',
                  iconUrl: 'assets/ic_modal_tv.png',
                  onTap: () {
                    // Navigator.pushNamed(context, PagesName.topupPage);
                  },
                ),
                HomeItem(
                  title: 'Food',
                  iconUrl: 'assets/ic_modal_coffee.png',
                  onTap: () {
                    // Navigator.pushNamed(context, PagesName.topupPage);
                  },
                ),
                HomeItem(
                  title: 'Travel',
                  iconUrl: 'assets/ic_modal_globe.png',
                  onTap: () {
                    // Navigator.pushNamed(context, PagesName.topupPage);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LatestTransactionSection extends StatelessWidget {
  const LatestTransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: AppTextStyle.blackPoppins(
              16,
              FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
            margin: const EdgeInsets.only(top: 14, bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                LatestTracItem(
                    iconUrl: 'assets/ic_trac_topup.png',
                    title: 'Top Up',
                    date: 'Yesterday',
                    value: '+ ${AppUtils.formatCurrency(450000)}'),
                LatestTracItem(
                    iconUrl: 'assets/ic_trac_cashback.png',
                    title: 'Cashback',
                    date: 'Sep 11',
                    value: '+ ${AppUtils.formatCurrency(22000)}'),
                LatestTracItem(
                    iconUrl: 'assets/ic_trac_withdraw.png',
                    title: 'Withdraw',
                    date: 'Sep 2',
                    value: '- ${AppUtils.formatCurrency(5000)}'),
                LatestTracItem(
                    iconUrl: 'assets/ic_trac_transfer.png',
                    title: 'Transfer',
                    date: 'Aug 27',
                    value: '- ${AppUtils.formatCurrency(123500)}'),
                LatestTracItem(
                    iconUrl: 'assets/ic_trac_electric.png',
                    title: 'Electric',
                    date: 'Feb 18',
                    value: '- ${AppUtils.formatCurrency(12300000)}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SendAgainSection extends StatelessWidget {
  const SendAgainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: AppTextStyle.blackPoppins(18, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: const [
                SendAgainItem(
                    imgUrl: 'assets/image_profile.png', username: 'yuanita'),
                SendAgainItem(
                    imgUrl: 'assets/image_profile.png', username: 'jani'),
                SendAgainItem(
                    imgUrl: 'assets/image_profile.png', username: 'urip'),
                SendAgainItem(
                    imgUrl: 'assets/image_profile.png', username: 'masa'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FirendlyTipsSection extends StatelessWidget {
  const FirendlyTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: AppTextStyle.blackPoppins(18, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          Wrap(
            spacing: 2,
            runSpacing: 18,
            children: const [
              FriendlyTipsItems(
                  thumbnail: 'assets/img_tips1.png',
                  title: 'Best tips for using a credit card',
                  url: 'https://www.google.com'),
              FriendlyTipsItems(
                  thumbnail: 'assets/img_tips2.png',
                  title: 'Spot the good pie of finance model',
                  url: 'https://www.google.com'),
              FriendlyTipsItems(
                  thumbnail: 'assets/img_tips3.png',
                  title: 'Great hack to get better advices',
                  url: 'https://www.google.com'),
              FriendlyTipsItems(
                  thumbnail: 'assets/img_tips4.png',
                  title: 'Save more penny buy this instead',
                  url: 'https://www.google.com'),
            ],
          ),
          AppUtils.spaceV(50),
        ],
      ),
    );
  }
}
