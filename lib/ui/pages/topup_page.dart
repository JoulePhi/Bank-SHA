import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      appBar: AppUtils.myAppBar('Top Up', context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          AppUtils.spaceV(30),
          Text(
            'Wallet',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(10),
          Row(
            children: [
              Image.asset(
                'assets/mini_wallet.png',
                height: 55,
              ),
              AppUtils.spaceH(16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: AppTextStyle.blackPoppins(16, FontWeight.w500),
                  ),
                  Text(
                    'Angga Risky',
                    style: AppTextStyle.greyPoppins(12, FontWeight.normal),
                  )
                ],
              )
            ],
          ),
          AppUtils.spaceV(40),
          Text(
            'Select Bank',
            style: AppTextStyle.blackPoppins(16, FontWeight.w600),
          ),
          AppUtils.spaceV(14),
          const BankItem(
            name: 'BANK BCA',
            logoUrl: 'assets/img_bca.png',
            isSelected: true,
          ),
          const BankItem(
            name: 'BANK BNI',
            logoUrl: 'assets/img_bni.png',
          ),
          const BankItem(
            name: 'BANK Mandiri',
            logoUrl: 'assets/img_mandiri.png',
          ),
          const BankItem(
            name: 'BANK OCBC',
            logoUrl: 'assets/img_ocbc.png',
          ),
          AppUtils.spaceV(30),
          FilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, PagesName.checkoutPage);
            },
          ),
          AppUtils.spaceV(30),
        ],
      ),
    );
  }
}
