import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:flutter/material.dart';

class BnB extends StatelessWidget {
  const BnB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      shape: const CircularNotchedRectangle(),
      elevation: 0,
      color: AppColors.whiteColor,
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextStyle.bluePoppins(10, FontWeight.w500),
        unselectedLabelStyle: AppTextStyle.blackPoppins(10, FontWeight.w500),
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.lightBlueColor,
        unselectedItemColor: AppColors.blackColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_bn_ov.png',
              color: AppColors.lightBlueColor,
              width: 20,
            ),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_bn_history.png',
              width: 20,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_bn_statistic.png',
              width: 20,
            ),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_bn_reward.png',
              width: 20,
            ),
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}

class FaB extends StatelessWidget {
  const FaB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.lightPurpleColor,
      child: Image.asset(
        'assets/ic_bn_add.png',
        width: 24,
      ),
    );
  }
}
